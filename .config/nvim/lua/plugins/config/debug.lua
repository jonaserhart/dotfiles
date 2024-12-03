return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{
			"rcarriga/nvim-dap-ui",
		},
		{
			"theHamsta/nvim-dap-virtual-text",
		},
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local dapvirtualtext = require("nvim-dap-virtual-text")

		dapui.setup()

		dapui.setup({
			layouts = {
				{
					elements = {
						{
							id = "breakpoints",
							size = 0.25,
						},
						{
							id = "stacks",
							size = 0.5,
						},
						{
							id = "watches",
							size = 0.25,
						},
					},
					position = "left",
					size = 20,
				},
				{
					elements = {
						{
							id = "repl",
							size = 0.5,
						},
						{
							id = "scopes",
							size = 0.5,
						},
					},
					position = "bottom",
					size = 20,
				},
			},
		})
		dapvirtualtext.setup()

		vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint)
		vim.keymap.set("n", "<Leader>dc", dap.continue)
		vim.keymap.set("n", "<F5>", dap.continue)
		vim.keymap.set("n", "<F10>", dap.step_over)
		vim.keymap.set("n", "<F11>", dap.step_into)
		vim.keymap.set("n", "<leader>K", dapui.eval)
		vim.keymap.set("n", "<leader>duq", dapui.close)

		vim.keymap.set("n", "<leader><F5>", dap.terminate)

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
			vim.cmd("Neotree close")
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
			vim.cmd("Neotree close")
		end
		require("plugins.languages.csharp.config.dap").setup()
	end,
}
