return {
	"natecraddock/workspaces.nvim",
	config = function()
		local workspaces = require("workspaces")
		workspaces.setup({
			hooks = {
				open = function()
					local p = require("workspaces").path()
					vim.notify("Opening workspace: " .. p, vim.log.levels.INFO, { title = "Workspaces" })
					vim.fn.chdir(p)
					vim.api.nvim_exec_autocmds("User", { pattern = "WorkspacesOpen" })
					vim.cmd("Telescope find_files")
					vim.cmd("Lazy reload neotest")
					vim.cmd("Lazy reload nvim-coverage")
				end,
			},
		})

		require("telescope").load_extension("workspaces")
		vim.keymap.set("n", "<leader>tw", ":Telescope workspaces<CR>", { noremap = true, desc = "Workspaces" })
	end,
}
