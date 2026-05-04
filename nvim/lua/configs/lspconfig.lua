require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "ruby_lsp",
  "elixir-ls",
  "ts_ls",
  "prettierd",
  "emmet-ls",
  "rust_analyzer",
  "gopls",
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
