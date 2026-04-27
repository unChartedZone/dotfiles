require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = "both" -- to enable cursorline!
o.wrap = false -- disabled line wrap

-- For diffview.nvim
local set = vim.opt -- set options
set.fillchars:append { diff = "╱" }

-- Set wrap for markdown files 
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true -- Optional: wraps at words instead of characters
  end,
})
