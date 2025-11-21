return {
	{
		"projekt0n/github-nvim-theme",
		name = "github-theme",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd('colorscheme github_dark')
		end,
	},
	{
		"AlexvZyl/nordic.nvim",
		priority = 1000,
		config = function()
			require("nordic").setup({})
			-- vim.cmd("colorscheme nordic")
		end,
	},
	{ 
    "EdenEast/nightfox.nvim",
		priority = 1000,
		config = function()
			vim.cmd("colorscheme nordfox")
		end,
  },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			-- vim.cmd("colorscheme catppuccin-frappe")
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			-- vim.cmd.colorscheme("tokyonight-moon")
		end,
	},
	{
		"philosofonusus/morta.nvim",
		name = "morta",
		priority = 1000,
		opts = {},
		config = function()
			-- vim.cmd.colorscheme 'morta'
		end,
	},
	{
		"Mofiqul/vscode.nvim",
		name = "vscode",
		priority = 1000,
		opts = {},
		config = function()
			-- vim.cmd.colorscheme 'vscode'
		end,
	},
}
