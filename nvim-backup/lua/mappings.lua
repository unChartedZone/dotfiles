require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("i", "jk", "<ESC>")

-- Toggle Float Term
map({ "n", "t" }, "<leader>tf", function()
	require("nvchad.term").toggle({ pos = "float", id = "float mcfloatface", size = 0.3 })
end, { desc = "Remap floating term" })

map({ "n", "t" }, "<M-`>", function()
  require("nvchad.term").toggle { pos = "float", id = "floaty", size = 0.3 }
end, { noremap = true, desc = "Remap toggle side term" })

map("n", "<leader>gb", function()
	require("snacks").git.blame_line()
end, { desc = "Git Blame Line" })

map("n", "<leader>fr", function()
	require("telescope.builtin").lsp_document_symbols()
end, { desc = "Find document symbols" })

map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "Format file" })

-- Run code actions
map("n", "<leader>ca", function()
  vim.lsp.buf.code_action()
end, { desc = "Code actions" })

map("n", "<leader>ls", function()
  vim.lsp.buf.signature_help { focus = false, silent = true, max_height = 7, border = "single" }
end, { desc = "LSP signature help" })

-- Show Github pull requests
map("n", "<leader>gp", function()
  require("snacks").picker.gh_pr()
end, { desc = "Github Pull Requests" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
