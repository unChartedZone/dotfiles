require("nvchad.configs.lspconfig").defaults()

local util = require "lspconfig/util"
local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

local servers = { "html", "cssls" }
-- vim.lsp.enable(servers)

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "js", "ts", "jsx", "tsx", "typescript", "typescriptreact" },
  root_dir = util.root_pattern "package.json",
}

lspconfig.ruby_lsp.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = { "ruby-lsp" },
  filetypes = { "ruby" },
  root_dir = util.root_pattern("Gemfile", ".git"),
  init_options = {
    formatter = "auto",
  },
}
-- read :h vim.lsp.config for changing options of lsp servers 
