return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	opts = {
		indent = {
			char = "│",
		},
		exclude = {
			filetypes = {
				"dashboard",
			},
			buftypes = { "terminal", "nofile" },
		},
		scope = {
			show_start = false,
			show_end = false,
		},
	},
}
