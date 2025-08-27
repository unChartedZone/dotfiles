-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "gruvbox",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}
M.mason = {
  pkgs = {
    "typescript-language-server",
    "ruby-lsp",
    "elixir-ls",
    "prettier",
  },
}

M.nvdash = { load_on_startup = true }
M.ui = {
  statusline = {
    separator_style = "round",
  },
  tabufline = {
    lazyload = false,
  },
  telescope = {
    style = "bordered"
  }
}

M.term = {
  float = {
    row = 0.1,
    col = 0.1,
    width = 0.8,
    height = 0.8,
  },
}

return M
