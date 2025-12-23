require("nvchad.configs.lspconfig").defaults()

local util = require("vim.lsp.util")
local nvlsp = require("nvchad.configs.lspconfig")

-- Custom on_attach that adds NvChad signature help
local on_attach = function(client, bufnr)
  nvlsp.on_attach(client, bufnr)
  require("nvchad.lsp.signature").setup(client, bufnr)
end

local servers = { "html", "cssls" }
-- vim.lsp.enable(servers)

-- lsps with default config
-- for _, lsp in ipairs(servers) do
-- 	vim.lsp.config(lsp, {
-- 		on_attach = on_attach,
-- 		on_init = nvlsp.on_init,
-- 		capabilities = nvlsp.capabilities,
-- 	})
-- end

vim.lsp.enable("ts_ls")
vim.lsp.enable("eslint_d")
-- vim.lsp.enable("ruby_lsp")
vim.lsp.enable("gopls")

-- read :h vim.lsp.config for changing options of lsp servers
