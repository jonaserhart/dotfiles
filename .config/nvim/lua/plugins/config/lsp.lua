return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		-- Set up language servers
		require("plugins.languages.go.config.lsp").setup()

		require("plugins.languages.lua.config.lsp").setup()

		require("plugins.languages.helm.config.lsp").setup()

		require("plugins.languages.typescript.config.lsp").setup()

		require("plugins.languages.bash.config.lsp").setup()

		vim.keymap.set("n", "<leader>tgr", ":Telescope lsp_references<cr>", {})
		vim.keymap.set("n", "<leader>tgi", ":Telescope lsp_implementations<cr>", {})
		vim.keymap.set("n", "<leader>tgT", ":Telescope lsp_type_definitions<cr>", {})
	end,
}
