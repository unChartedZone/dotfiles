require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "gO", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "LSP document symbols (Telescope)" })
map("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "LSP go to definition (Telescope)" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
