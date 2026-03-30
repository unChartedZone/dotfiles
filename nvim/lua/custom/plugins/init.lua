-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      local dashboard_header = require 'custom.dashboard_header'
      dashboard_header.patch()

      require('dashboard').setup {
        theme = 'hyper',
        config = {
          header = dashboard_header.colored_header.lines,
          custom_header_hl = dashboard_header.colored_header,
          shortcut = {
            { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Files',
              group = 'Label',
              action = 'Telescope find_files',
              key = 'f',
            },
            {
              desc = ' Apps',
              group = 'DiagnosticHint',
              action = 'Telescope app',
              key = 'a',
            },
            {
              desc = ' dotfiles',
              group = 'Number',
              action = 'Telescope dotfiles',
              key = 'd',
            },
          },
          packages = { enable = true },
        },
      }
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },
  {
    'akinsho/bufferline.nvim',
    lazy = false,
    keys = {
      { '<Tab>', '<cmd>BufferLineCycleNext<CR>', desc = 'Next buffer' },
      { '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', desc = 'Prev buffer' },
    },
    config = function()
      require('bufferline').setup {}
    end,
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  },
  {
    'NeogitOrg/neogit',
    cmd = 'Neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration
      'nvim-telescope/telescope.nvim', -- optional
    },
    config = function()
      require('neogit').setup()
    end,
  },
}
