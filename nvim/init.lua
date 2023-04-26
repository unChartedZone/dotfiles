--[[

███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

--]]


-- General
vim.opt.number = true         -- Show line numbers
vim.opt.wrap = false          -- Wrap lines
vim.opt.showmatch = true      -- Highlight matching brace
vim.opt.textwidth = 80        -- Line wrap (number of cols)
vim.opt.laststatus = 2        -- always show statusline
vim.opt.showtabline = 2       -- always show tabline
vim.opt.mouse = "a"           -- allow mouse to move cursor
vim.opt.clipboard = "unnamed" -- Lets vim and system clipboard play nice together

-- Indentation

-- Colorscheme
vim.opt.termguicolors = true

local actions = require "telescope.actions"
local config = require "telescope.config"


require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      }
    }
  },
}

require("feline-config")
