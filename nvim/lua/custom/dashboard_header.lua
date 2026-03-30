local api = vim.api

local M = {}

--- Center a block of lines uniformly based on the widest line,
--- so relative alignment (ASCII art) is preserved.
local function center_align_block(lines)
  local max_width = 0
  for _, line in ipairs(lines) do
    local w = api.nvim_strwidth(line)
    if w > max_width then
      max_width = w
    end
  end
  local pad = math.max(0, math.floor((vim.o.columns - max_width) / 2))
  local prefix = string.rep(' ', pad)
  local result = {}
  for i, line in ipairs(lines) do
    result[i] = prefix .. line
  end
  return result
end

M.lines = {
  '                                               ',
  '        ███████████           █████      ██',
  '       ███████████             █████ ',
  '       ████████████████ ███████████ ███   ███████',
  '      ████████████████ ████████████ █████ ██████████████',
  '     █████████████████████████████ █████ █████ ████ █████',
  '   ██████████████████████████████████ █████ █████ ████ █████',
  '  ██████  ███ █████████████████ ████ █████ █████ ████ ██████',
  '  ██████   ██  ███████████████   ██ █████████████████',
  '  ██████   ██  ███████████████   ██ █████████████████',
}

local hl_cache = {}

local function rgb_to_hex(r, g, b)
  return string.format('#%02x%02x%02x', r, g, b)
end

local function ansi_256_to_hex(color)
  local base = {
    { 0, 0, 0 },
    { 128, 0, 0 },
    { 0, 128, 0 },
    { 128, 128, 0 },
    { 0, 0, 128 },
    { 128, 0, 128 },
    { 0, 128, 128 },
    { 192, 192, 192 },
    { 128, 128, 128 },
    { 255, 0, 0 },
    { 0, 255, 0 },
    { 255, 255, 0 },
    { 0, 0, 255 },
    { 255, 0, 255 },
    { 0, 255, 255 },
    { 255, 255, 255 },
  }

  if color < 16 then
    local rgb = base[color + 1]
    return rgb_to_hex(rgb[1], rgb[2], rgb[3])
  end

  if color < 232 then
    local value = color - 16
    local levels = { 0, 95, 135, 175, 215, 255 }
    local r = levels[math.floor(value / 36) + 1]
    local g = levels[math.floor((value % 36) / 6) + 1]
    local b = levels[(value % 6) + 1]
    return rgb_to_hex(r, g, b)
  end

  local level = 8 + (color - 232) * 10
  return rgb_to_hex(level, level, level)
end

local function highlight_group(hex)
  local group = 'DashboardHeaderLolcat' .. hex:gsub('#', ''):upper()
  if not hl_cache[group] then
    api.nvim_set_hl(0, group, { fg = hex })
    hl_cache[group] = true
  end
  return group
end

local function update_state(state, codes)
  local values = {}
  for value in codes:gmatch('%d+') do
    values[#values + 1] = tonumber(value)
  end

  local i = 1
  while i <= #values do
    local code = values[i]
    if code == 0 or code == 39 then
      state.fg = nil
    elseif code == 38 then
      if values[i + 1] == 2 then
        local r, g, b = values[i + 2], values[i + 3], values[i + 4]
        if r and g and b then
          state.fg = rgb_to_hex(r, g, b)
        end
        i = i + 4
      elseif values[i + 1] == 5 then
        local color = values[i + 2]
        if color then
          state.fg = ansi_256_to_hex(color)
        end
        i = i + 2
      end
    end
    i = i + 1
  end
end

local function parse_ansi_line(line)
  local plain_parts = {}
  local spans = {}
  local state = { fg = nil }
  local byte_count = 0
  local index = 1

  while true do
    local start_pos, end_pos, codes = line:find('\27%[([%d;]+)m', index)
    local chunk_end = start_pos and start_pos - 1 or #line
    local chunk = line:sub(index, chunk_end)

    if #chunk > 0 then
      plain_parts[#plain_parts + 1] = chunk
      if state.fg then
        spans[#spans + 1] = {
          start_byte = byte_count,
          end_byte = byte_count + #chunk,
          group = highlight_group(state.fg),
        }
      end
      byte_count = byte_count + #chunk
    end

    if not start_pos then
      break
    end

    update_state(state, codes)
    index = end_pos + 1
  end

  return table.concat(plain_parts), spans
end

local function build_spans(lines)
  local lolcat = vim.fn.exepath('lolcat')
  if lolcat == '' then
    return nil
  end

  local output = vim.fn.systemlist({ lolcat, '-f', '-S', '41' }, table.concat(lines, '\n') .. '\n')
  if vim.v.shell_error ~= 0 or #output ~= #lines then
    return nil
  end

  local parsed_lines = {}
  local spans_by_line = {}
  for i, line in ipairs(output) do
    local plain_line, spans = parse_ansi_line(line)
    parsed_lines[i] = plain_line
    spans_by_line[i] = spans
  end

  return {
    lines = parsed_lines,
    spans_by_line = spans_by_line,
  }
end

local function apply_spans(bufnr, centered_lines, header)
  for row, spans in ipairs(header.spans_by_line or {}) do
    local left_pad = #centered_lines[row] - #header.lines[row]
    for _, span in ipairs(spans) do
      api.nvim_buf_add_highlight(
        bufnr,
        0,
        span.group,
        row - 1,
        left_pad + span.start_byte,
        left_pad + span.end_byte
      )
    end
  end
end

M.colored_header = build_spans(M.lines) or {
  lines = M.lines,
  spans_by_line = {},
}

function M.patch()
  local header = require('dashboard.theme.header')
  if header._lolcat_header_patched then
    return
  end

  local original_generate_header = header.generate_header

  header.generate_header = function(config)
    if config.command or not config.custom_header_hl then
      return original_generate_header(config)
    end

    if not vim.bo[config.bufnr].modifiable then
      vim.bo[config.bufnr].modifiable = true
    end

    local centered_lines = center_align_block(config.custom_header_hl.lines)
    api.nvim_buf_set_lines(config.bufnr, 0, -1, false, centered_lines)

    for row = 1, #centered_lines do
      api.nvim_buf_add_highlight(config.bufnr, 0, 'DashboardHeader', row - 1, 0, -1)
    end

    apply_spans(config.bufnr, centered_lines, config.custom_header_hl)
  end

  header._lolcat_header_patched = true
end

return M
