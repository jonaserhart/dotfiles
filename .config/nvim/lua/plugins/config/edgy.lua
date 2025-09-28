return {
	"folke/edgy.nvim",
	event = "VeryLazy",
	enable = true,
	init = function() end,
	config = function(_, opts)
		require("edgy").setup(opts)
		-- require("edgy").toggle()
		vim.cmd([[ 
hi EdgyNormal guibg=NONE ctermbg=NONE
hi EdgyNormalNC guibg=NONE ctermbg=NONE
    ]])
	end,
	opts = {
		icons = {
			closed = "",
			open = "",
		},
		left = {
			-- {
			--   wo = {
			--     winbar = false,
			--   },
			--   ft = "NvimTree",
			--   filter = function(_, win)
			--     return vim.api.nvim_win_get_config(win).relative == ""
			--   end,
			--   size = { height = 1.0, width = 0.2 },
			-- },
			{
				wo = {
					winbar = false,
				},
				ft = "neo-tree",
				filter = function(_, win)
					return vim.api.nvim_win_get_config(win).relative == ""
				end,
				size = { height = 1.0, width = 0.2 },
			},
			{
				title = "Watches",
				ft = "dapui_watches",
				size = { width = 0.15 },
			},
			{
				title = "Stacks",
				ft = "dapui_stacks",
				size = { width = 0.15 },
			},
			{
				title = "Breakpoints",
				ft = "dapui_breakpoints",
				size = { width = 0.15 },
			},
		},
		bottom = {
			{
				title = "Terminal",
				ft = "toggleterm",
				size = { height = 0.4 },
				-- exclude floating windows
				filter = function(_, win)
					return vim.api.nvim_win_get_config(win).relative == ""
				end,
			},
			{ ft = "qf", title = "QuickFix" },
			{
				ft = "help",
				size = { height = 20 },
				-- only show help buffers
				filter = function(buf)
					return vim.bo[buf].buftype == "help"
				end,
			},
			{
				title = "Diagnostics",
				size = { height = 0.4 },
				ft = "trouble",
			},
			{
				title = "Debug console",
				ft = "dap-repl",
				size = { height = 0.33 },
			},
			{
				title = "Locals",
				ft = "dapui_scopes",
				size = { height = 0.33 },
			},
		},
		right = {
			{
				title = "Tests",
				ft = "neotest-summary",
				open = "Neotest summary open",
				size = { width = 0.25 },
			},
			{
				title = "Tasks",
				ft = "neowarrior",
				open = "NeowarriorOpen",
				size = { width = 0.3 },
			},
			{
				title = "Commit",
				ft = "NeogitStatus",
				filter = function(_, win)
					return vim.api.nvim_win_get_config(win).relative == ""
				end,
				size = { width = 0.4 },
			},
		},
	},
}
