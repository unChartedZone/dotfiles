return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre", -- uncomment for format on save
		opts = require("configs.conform"),
	},

	-- These are some examples, uncomment them if you want to see them work!
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			ensure_installed = {
				"lua_ls",
				"ruby_lsp",
			},
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		opts = function()
			local conf = require("nvchad.configs.telescope")

			conf.defaults.file_ignore_patterns = { "node_modules" }
			conf.defaults.mappings.i = {
				["<C-j>"] = require("telescope.actions").move_selection_next,
				["<C-k>"] = require("telescope.actions").move_selection_previous,
				["<Esc>"] = require("telescope.actions").close,
			}
			return conf
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
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
				"ruby",
				"tmux",
			},
		},
	},
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			bigfile = { enabled = true },
			dashboard = { enabled = false },
			explorer = { enabled = false },
			indent = { enabled = false },
			input = { enabled = true },
			picker = { enabled = true },
			notifier = { enabled = true },
			quickfile = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = false },
			statuscolumn = { enabled = true },
			words = { enabled = true },
			gh = { enabled = true },
		},
	},
	{
		"APZelos/blamer.nvim",
		lazy = false,
		config = function()
			vim.g.blamer_enabled = true
		end,
	},
	{
		"NeogitOrg/neogit",
		cmd = "Neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = function()
			require("neogit").setup()
			dofile(vim.g.base46_cache .. "git")
			dofile(vim.g.base46_cache .. "neogit")
			dofile(vim.g.base46_cache .. "diffview")
		end,
	},
	{
		"vague2k/vague.nvim",
		-- lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other plugins
		config = function()
			-- NOTE: you do not need to call setup if you don't want to.
			require("vague").setup({
				-- optional configuration here
			})
			-- vim.cmd("colorscheme vague")
		end,
	},
	{
		"f-person/auto-dark-mode.nvim",
		lazy = false,
		opts = {
			set_dark_mode = function()
				-- Change to your preferred dark theme
				-- require("nvconfig").base46.theme = 'vscode_dark'
				-- require("base46").load_all_highlights()
			end,
			set_light_mode = function()
				-- Change to your preferred light theme
				-- require("nvconfig").base46.theme = 'vscode_light'
				-- require("base46").load_all_highlights()
			end,
			update_interval = 3000,
			fallback = "dark",
		},
	},
	-- test new blink
	{ import = "nvchad.blink.lazyspec" },
}
