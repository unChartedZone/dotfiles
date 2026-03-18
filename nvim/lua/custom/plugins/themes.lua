return {
  {
    'vague-theme/vague.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other plugins
    config = function()
      -- NOTE: you do not need to call setup if you don't want to.
      require('vague').setup {
        -- optional configuration here
      }
      vim.cmd 'colorscheme vague'
    end,
  },
  {
    'marko-cerovac/material.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other plugins
    config = function()
      -- vim.cmd 'colorscheme material-darker'
    end,
  },
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          comments = { italic = false }, -- Disable italics in comments
        },
      }

      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      -- vim.cmd 'colorscheme tokyonight-night'
    end,
  },
  {
    'olivercederborg/poimandres.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      local p = require 'poimandres.palette'
      require('poimandres').setup {
        -- leave this setup function empty for default config
        -- or refer to the configuration section
        -- for configuration options
        highlight_groups = {
          LspReferenceText = { bg = p.background1 },
          LspReferenceRead = { bg = p.background1 },
          LspReferenceWrite = { bg = p.background1 },
        },
      }
    end,

    -- optionally set the colorscheme within lazy config
    init = function()
      -- vim.cmd 'colorscheme poimandres'
    end,
  },
}
