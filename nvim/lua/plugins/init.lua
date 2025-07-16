return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      local conf = require "nvchad.configs.telescope"

       conf.defaults.file_ignore_patterns = { "node_modules", "dist", ".next", "tmp", "_build", "target" }
       conf.defaults.mappings.i = {
         ["<C-j>"] = require("telescope.actions").move_selection_next,
         ["<C-k>"] = require("telescope.actions").move_selection_previous,
         ["<Esc>"] = require("telescope.actions").close,
       }
       return conf
    end,
  },
 {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "scss",
        "javascript",
        "styled",
        "typescript",
        "tsx",
        "elixir",
      },
    },
  }

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
