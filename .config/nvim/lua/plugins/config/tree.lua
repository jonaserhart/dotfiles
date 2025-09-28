return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				hide_root_node = true,
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_by_name = {
						"node_modules",
						".git",
					},
				},
			},
			default_component_configs = {
				indent = {
					with_markers = false,
				},
				icon = {
					folder_closed = " ",
					folder_open = "󰝰 ",
					folder_empty = " ",
					provider = function(icon, node) -- default icon provider utilizes nvim-web-devicons if available
						if node.type == "file" or node.type == "terminal" then
							local success, web_devicons = pcall(require, "nvim-web-devicons")
							local name = node.type == "terminal" and "terminal" or node.name
							if success then
								local devicon, hl = web_devicons.get_icon(name)
								icon.text = devicon or icon.text
								icon.highlight = hl or icon.highlight
							end
						end
					end,
					-- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
					-- then these will never be used.
					default = "*",
					highlight = "NeoTreeFileIcon",
				},
			},
		})
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
		vim.keymap.set("n", "<C-C>", ":Neotree filesystem close<CR>", {})
		--
	end,
}
