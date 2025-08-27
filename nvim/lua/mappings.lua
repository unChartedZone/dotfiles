require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("i", "jk", "<ESC>")

-- Toggle Float Term
map({ "n", "t" }, "<leader>tl", function()
  require("nvchad.term").toggle { pos = "vsp", id = "floo", size = 0.3 }
end, { noremap = true, desc = "Remap toggle side term" })

map({ "n", "t" }, "<C-t>", function()
  require("nvchad.term").toggle { pos = "float", id = "floaty" }
end, { noremap = true, desc = "Toggle floating terminal" })

map("n", "<leader>gb", function()
  require("snacks").git.blame_line()
end, { desc = "Git Blame Line" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
