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
	{ "EdenEast/nightfox.nvim" },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				term_colors = false,
				color_overrides = {
					latte = {
						rosewater = "#dc8a78",
						flamingo = "#dd7878",
						pink = "#ea76cb",
						mauve = "#d70071",
						red = "#d20f39",
						maroon = "#dc37b0",
						peach = "#dc37b0",
						yellow = "#00b1ed",
						green = "#40a02b",
						teal = "#179299",
						sky = "#04a5e5",
						sapphire = "#209fb5",
						blue = "#1e66f5",
						lavender = "#7287fd",
						text = "#4c4f69",
						subtext1 = "#5c5f77",
						subtext0 = "#6c6f85",
						overlay2 = "#7c7f93",
						overlay1 = "#8c8fa1",
						overlay0 = "#9ca0b0",
						surface2 = "#acb0be",
						surface1 = "#bcc0cc",
						surface0 = "#ccd0da",
						base = "#eff1f5",
						mantle = "#e6e9ef",
						crust = "#dce0e8",
					},
					frappe = {
						rosewater = "#f5e0dc",
						flamingo = "#f2cdcd",
						pink = "#f5c2e7",
						mauve = "#b477cf",
						red = "#CF7277",
						maroon = "#acb2be",
						peach = "#dfc184",
						yellow = "#6eb4bf",
						green = "#a1c181",
						teal = "#94e2d5",
						sky = "#89dceb",
						sapphire = "#74c7ec",
						blue = "#6798cb",
						lavender = "#acb2be",
						mantle = "#2f343e",
						crust = "#11111b",
						text = "#acb2be",
						subtext1 = "#5d636f",
						subtext0 = "#5d636f",
						overlay2 = "#5d636f",
						overlay1 = "#5d636f",
						overlay0 = "#5d636f",
						surface2 = "#454a56",
						surface1 = "#454a56",
						surface0 = "#454a56",
						base = "#282c33",
					},
				},
				highlight_overrides = {
					frappe = function(colors)
						vim.g.terminal_color_0 = colors.overlay0
						vim.g.terminal_color_8 = colors.overlay1
						vim.g.terminal_color_1 = colors.red
						vim.g.terminal_color_9 = colors.red
						vim.g.terminal_color_2 = colors.green
						vim.g.terminal_color_10 = colors.green
						vim.g.terminal_color_3 = colors.yellow
						vim.g.terminal_color_11 = colors.yellow
						vim.g.terminal_color_4 = colors.blue
						vim.g.terminal_color_12 = colors.blue
						vim.g.terminal_color_5 = colors.pink
						vim.g.terminal_color_13 = colors.pink
						vim.g.terminal_color_6 = colors.sky
						vim.g.terminal_color_14 = colors.sky
						vim.g.terminal_color_7 = colors.text
						vim.g.terminal_color_15 = colors.text
						return {
							NeoTreeDirectoryIcon = { fg = colors.text },
							NeoTreeDirectoryName = { fg = colors.text },
							NeoTreeGitUntracked = { fg = colors.text },
							NeoTreeNormalNC = { link = "EdgyNormal" },
							LspInlayHint = { link = "@comment" },
							-- PmenuSel = { fg = "#bdd3ff", bg = "#3b3f52" }
						}
					end,
				},
			})
			vim.cmd("colorscheme catppuccin-frappe")
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
