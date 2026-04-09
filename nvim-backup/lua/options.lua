require("nvchad.options")

-- add yours here!
local o = vim.o
o.wrap = false
o.relativenumber = true
o.cursorlineopt = "both" -- to enable cursorline!

local set = vim.opt -- set options
set.fillchars:append { diff = "╱" }
