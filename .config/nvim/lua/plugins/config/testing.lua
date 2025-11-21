return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-plenary",
		"nvim-neotest/neotest-vim-test",
		"nvim-neotest/neotest-jest",
		{
			"fredrikaverpil/neotest-golang",
			dependencies = {
				{
					"leoluz/nvim-dap-go",
					opts = {},
				},
			},
			branch = "main",
		},
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-golang")({
					runner = "gotestsum",
					go_test_args = {
						"-count=1",
						"-race",
						"-v",
						"-tags=integration,e2e,component",
						"-coverprofile=" .. vim.fn.getcwd() .. "/cover.out",
					},
				}),
				require("neotest-jest")({
					jestCommand = "npm test --",
					jestConfigFile = "jest.config.js",
					env = { CI = true },
					cwd = function(_)
						return vim.fn.getcwd()
					end,
				}),
			},
		})
	end,
	keys = {
		{
			"<leader>tA",
			function()
				require("neotest").run.run(vim.uv.cwd())
			end,
			desc = "[t]est [A]ll files",
		},
		{
			"<leader>tn",
			function()
				require("neotest").run.run()
			end,
			desc = "[t]est [n]earest",
		},
		{
			"<leader>ts",
			function()
				require("neotest").summary.toggle()
			end,
			desc = "[t]est [s]ummary",
		},
		{
			"<leader>to",
			function()
				require("neotest").output.open({ enter = true, auto_close = true })
			end,
			desc = "[t]est [o]utput",
		},
		{
			"<leader>tO",
			function()
				require("neotest").output_panel.toggle()
			end,
			desc = "[t]est [O]utput panel",
		},
		{
			"<leader>td",
			function()
				require("neotest").run.run({ suite = false, strategy = "dap" })
			end,
			desc = "Debug nearest test",
		},
	},
}
