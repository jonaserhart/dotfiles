return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter")
		config.setup({})
	end,
}
