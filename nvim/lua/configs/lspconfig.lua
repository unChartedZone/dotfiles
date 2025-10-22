-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local util = require "lspconfig/util"
local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"
local vue_ls_path = "/Users/chris/.nvm/versions/node/v24.9.0/lib/node_modules/@vue/language-server"

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
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vue_ls_path,
        languages = { "vue" },
      },
    },
  },
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "js", "ts", "jsx", "tsx", "vue", "typescript", "typescriptreact" },
  root_dir = util.root_pattern "package.json",
}

lspconfig.volar.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  filetypes = { "vue" },
  root_dir = util.root_pattern "package.json",
}

lspconfig.gopls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern "go.mod",
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

lspconfig.csharp_ls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = { "csharp-ls" },
  filetypes = { "cs" },
  root_dir = util.root_pattern("*.sln", ".git"),
  init_options = {
    formatter = "auto",
    AutomaticWorkspaceInit = true,
  },
}

lspconfig.elixirls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = { "/Users/chris/Workshop/lsp/elixir-ls/language_server.sh" },
  filetypes = { "elixir", "eelixir", "heex", "surface" },
  root_dir = util.root_pattern "mix.exs",
}
