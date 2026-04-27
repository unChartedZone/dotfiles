return {
  {
    "NeogitOrg/neogit",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim", -- required

      -- Only one of these is needed.
      -- "sindrets/diffview.nvim", -- optional
      "esmuellert/codediff.nvim", -- optional

      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
    },
    cmd = "Neogit",
    keys = {
      { "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
    },
		config = function()
			require("neogit").setup()
			dofile(vim.g.base46_cache .. "git")
			dofile(vim.g.base46_cache .. "neogit")
			dofile(vim.g.base46_cache .. "diffview")
		end,
  },
}
