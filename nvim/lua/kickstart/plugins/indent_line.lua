return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = function()
      local highlight = {
        'IndentBlanklineIndent1',
        'IndentBlanklineIndent2',
        'IndentBlanklineIndent3',
      }
      local hooks = require 'ibl.hooks'

      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, 'IndentBlanklineIndent1', { fg = '#30465d', bg = '#14262b', nocombine = true })
        vim.api.nvim_set_hl(0, 'IndentBlanklineIndent2', { fg = '#30465d', bg = '#09262e', nocombine = true })
        vim.api.nvim_set_hl(0, 'IndentBlanklineIndent3', { fg = '#30465d', bg = '#161e37', nocombine = true })
      end)

      return {
        indent = {
          char = '▎',
          highlight = highlight,
        },
        whitespace = {
          highlight = highlight,
          remove_blankline_trail = true,
        },
        exclude = {
          filetypes = { 'dashboard' },
        },
      }
    end,
  },
}
