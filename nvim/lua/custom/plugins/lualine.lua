return {
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local function get_highlight(name)
        local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = name, link = false })
        return ok and hl or {}
      end

      local function to_hex(color)
        return color and string.format('#%06x', color) or nil
      end

      local function pick_color(groups, attr, fallback)
        for _, group in ipairs(groups) do
          local value = to_hex(get_highlight(group)[attr])
          if value then
            return value
          end
        end

        return fallback
      end

      local function palette()
        return {
          bg = pick_color({ 'StatusLine', 'Normal' }, 'bg', '#1f2335'),
          fg = pick_color({ 'StatusLine', 'Normal' }, 'fg', '#c0caf5'),
          alt_bg = pick_color({ 'CursorLine', 'StatusLineNC', 'Visual' }, 'bg', '#24283b'),
          muted = pick_color({ 'Comment', 'NonText' }, 'fg', '#565f89'),
          blue = pick_color({ 'DiagnosticInfo', 'Function', 'Directory' }, 'fg', '#7aa2f7'),
          cyan = pick_color({ 'DiagnosticHint', 'Type' }, 'fg', '#7dcfff'),
          green = pick_color({ 'DiagnosticOk', 'String', 'DiffAdd' }, 'fg', '#9ece6a'),
          yellow = pick_color({ 'DiagnosticWarn', 'Constant' }, 'fg', '#e0af68'),
          red = pick_color({ 'DiagnosticError', 'ErrorMsg' }, 'fg', '#f7768e'),
          purple = pick_color({ 'Special', 'Statement' }, 'fg', '#bb9af7'),
          orange = pick_color({ 'Number', 'Character' }, 'fg', '#ff9e64'),
        }
      end

      local mode_names = {
        n = 'NORMAL',
        no = 'NORMAL',
        nov = 'NORMAL',
        noV = 'NORMAL',
        ['no\22'] = 'NORMAL',
        niI = 'NORMAL',
        niR = 'NORMAL',
        niV = 'NORMAL',
        nt = 'NORMAL',
        v = 'VISUAL',
        vs = 'VISUAL',
        V = 'V-LINE',
        Vs = 'V-LINE',
        ['\22'] = 'V-BLOCK',
        ['\22s'] = 'V-BLOCK',
        s = 'SELECT',
        S = 'S-LINE',
        ['\19'] = 'S-BLOCK',
        i = 'INSERT',
        ic = 'INSERT',
        ix = 'INSERT',
        R = 'REPLACE',
        Rc = 'REPLACE',
        Rx = 'REPLACE',
        Rv = 'V-REPLACE',
        c = 'COMMAND',
        cv = 'COMMAND',
        ce = 'COMMAND',
        r = 'PROMPT',
        rm = 'MORE',
        ['r?'] = 'CONFIRM',
        ['!'] = 'SHELL',
        t = 'TERMINAL',
      }

      local mode_palette = {
        n = 'green',
        no = 'green',
        nov = 'green',
        noV = 'green',
        ['no\22'] = 'green',
        niI = 'green',
        niR = 'green',
        niV = 'green',
        nt = 'green',
        v = 'purple',
        vs = 'purple',
        V = 'purple',
        Vs = 'purple',
        ['\22'] = 'purple',
        ['\22s'] = 'purple',
        s = 'orange',
        S = 'orange',
        ['\19'] = 'orange',
        i = 'blue',
        ic = 'blue',
        ix = 'blue',
        R = 'red',
        Rc = 'red',
        Rx = 'red',
        Rv = 'red',
        c = 'yellow',
        cv = 'yellow',
        ce = 'yellow',
        r = 'cyan',
        rm = 'cyan',
        ['r?'] = 'cyan',
        ['!'] = 'red',
        t = 'cyan',
      }

      local function current_mode()
        local mode = vim.api.nvim_get_mode().mode
        return mode_names[mode] or mode_names[mode:sub(1, 1)] or mode
      end

      local function current_mode_color()
        local colors = palette()
        local mode = vim.api.nvim_get_mode().mode
        local color_key = mode_palette[mode] or mode_palette[mode:sub(1, 1)] or 'green'
        return colors[color_key]
      end

      local function hide_in_width(width)
        return vim.fn.winwidth(0) > width
      end

      local function diff_source()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
          return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
          }
        end
      end

      local function filename()
        local file = vim.fn.expand '%:~:.'
        if file == '' then
          file = '[No Name]'
        end

        if not hide_in_width(100) then
          file = vim.fn.pathshorten(file, 2)
        end

        local parts = {}

        if vim.g.have_nerd_font then
          local ok, devicons = pcall(require, 'nvim-web-devicons')
          if ok then
            local icon = devicons.get_icon(vim.fn.expand '%:t', vim.fn.expand '%:e', { default = true })
            if icon then
              parts[#parts + 1] = icon
            end
          end
        end

        parts[#parts + 1] = file

        if vim.bo.modified then
          parts[#parts + 1] = '●'
        end

        if vim.bo.readonly or not vim.bo.modifiable then
          parts[#parts + 1] = ''
        end

        return table.concat(parts, ' ')
      end

      local function lsp_clients()
        local clients = vim.lsp.get_clients { bufnr = 0 }
        if not clients or vim.tbl_isempty(clients) then
          return ''
        end

        local names = {}
        for _, client in ipairs(clients) do
          if client.name ~= 'copilot' and client.name ~= 'null-ls' then
            names[#names + 1] = client.name
          end
        end

        if vim.tbl_isempty(names) then
          return ''
        end

        if #names > 2 then
          return string.format('%s %s +%d', vim.g.have_nerd_font and '' or 'LSP', names[1], #names - 1)
        end

        return string.format('%s %s', vim.g.have_nerd_font and '' or 'LSP', table.concat(names, ', '))
      end

      local function has_lsp()
        return lsp_clients() ~= ''
      end

      local function cwd()
        local dir = vim.fn.fnamemodify(vim.fn.getcwd(0), ':t')
        if dir == '' then
          dir = vim.fn.fnamemodify(vim.fn.getcwd(0), ':~')
        end

        return string.format('%s %s', vim.g.have_nerd_font and '󰉋' or 'DIR', dir)
      end

      local function ruler()
        local line = vim.fn.line '.'
        local column = vim.fn.col '.'
        local total = vim.fn.line '$'
        local percent = total == 0 and 0 or math.floor((line / total) * 100)

        return string.format('%3d%%%% %d:%d', percent, line, column)
      end

      require('lualine').setup {
        options = {
          always_divide_middle = false,
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = { 'dashboard', 'alpha', 'starter', 'snacks_dashboard' },
          },
          globalstatus = true,
          theme = 'auto',
        },
        sections = {
          lualine_a = {
            {
              function()
                local icon = vim.g.have_nerd_font and ' ' or ''
                return icon .. current_mode()
              end,
              color = function()
                local colors = palette()
                return { fg = colors.bg, bg = current_mode_color(), gui = 'bold' }
              end,
              separator = { left = '', right = '' },
              padding = { left = 1, right = 1 },
            },
          },
          lualine_b = {
            {
              filename,
              color = function()
                local colors = palette()
                return { fg = colors.fg, bg = colors.alt_bg }
              end,
              separator = { left = '', right = '' },
              padding = { left = 1, right = 1 },
            },
          },
          lualine_c = {
            {
              'branch',
              color = function()
                local colors = palette()
                return { fg = colors.blue, bg = colors.alt_bg }
              end,
              cond = function()
                return vim.b.gitsigns_head ~= nil and hide_in_width(80)
              end,
              icon = vim.g.have_nerd_font and ' ' or 'git ',
              padding = { left = 1, right = 0 },
              separator = { left = '' },
            },
            {
              'diff',
              color = function()
                local colors = palette()
                return { bg = colors.alt_bg }
              end,
              cond = function()
                return vim.b.gitsigns_head ~= nil and hide_in_width(80)
              end,
              diff_color = {
                added = function()
                  local colors = palette()
                  return { fg = colors.green }
                end,
                modified = function()
                  local colors = palette()
                  return { fg = colors.yellow }
                end,
                removed = function()
                  local colors = palette()
                  return { fg = colors.red }
                end,
              },
              padding = { left = 0, right = 1 },
              separator = { right = '' },
              source = diff_source,
              symbols = vim.g.have_nerd_font and {
                added = '  ',
                modified = ' ',
                removed = ' ',
              } or {
                added = '+',
                modified = '~',
                removed = '-',
              },
            },
          },
          lualine_x = {
            {
              'diagnostics',
              color = function()
                local colors = palette()
                return { bg = colors.alt_bg }
              end,
              colored = true,
              cond = function()
                return hide_in_width(90)
              end,
              sections = { 'error', 'warn', 'info', 'hint' },
              separator = { left = '', right = '' },
              sources = { 'nvim_diagnostic' },
              symbols = vim.g.have_nerd_font and {
                error = '󰅚 ',
                warn = '󰀪 ',
                info = '󰋽 ',
                hint = '󰌶 ',
              } or {
                error = 'E:',
                warn = 'W:',
                info = 'I:',
                hint = 'H:',
              },
              update_in_insert = false,
            },
            {
              lsp_clients,
              color = function()
                local colors = palette()
                return { fg = colors.cyan, bg = colors.alt_bg }
              end,
              cond = function()
                return has_lsp() and hide_in_width(110)
              end,
              separator = { left = '', right = '' },
              padding = { left = 1, right = 1 },
            },
            {
              cwd,
              color = function()
                local colors = palette()
                return { fg = colors.yellow, bg = colors.alt_bg }
              end,
              cond = function()
                return hide_in_width(120)
              end,
              separator = { left = '', right = '' },
              padding = { left = 1, right = 1 },
            },
          },
          lualine_y = {},
          lualine_z = {
            {
              ruler,
              color = function()
                local colors = palette()
                return { fg = colors.bg, bg = colors.blue, gui = 'bold' }
              end,
              separator = { left = '', right = '' },
              padding = { left = 1, right = 1 },
            },
          },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            {
              filename,
              color = function()
                local colors = palette()
                return { fg = colors.muted, bg = colors.bg }
              end,
            },
          },
          lualine_x = {
            {
              'location',
              color = function()
                local colors = palette()
                return { fg = colors.muted, bg = colors.bg }
              end,
            },
          },
          lualine_y = {},
          lualine_z = {},
        },
      }
    end,
  },
}
