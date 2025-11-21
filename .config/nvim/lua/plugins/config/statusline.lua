return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				component_separators = "",
				section_separators = { left = " ", right = " " },
				disabled_filetypes = {
					"dashboard",
					"quickfix",
					"prompt",
					"trouble",
					"orgagenda",
					winbar = { "NvimTree" },
				},
				theme = "auto",
        globalstatus = true,
			},
			sections = {
				-- lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
				lualine_a = { { "mode", right_padding = 2 } },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {
					"%=",
					{
						function()
							local msg = "No Active Lsp"
							local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
							local clients = vim.lsp.get_clients()
							local client_names = {}
							if next(clients) == nil then
								return msg
							end
							for _, client in ipairs(clients) do
								if client.name == "null-ls" then
									goto continue
								end
								local filetypes = client.config.filetypes
								if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
									table.insert(client_names, client.name .. "(" .. client.id .. ")")
								end
								::continue::
							end
							if #client_names <= 0 then
								return msg
							end
							return table.concat(client_names, ", ")
						end,
						icon = " LSP:",
						color = { gui = "bold" },
					},
				},
				lualine_x = {},
				lualine_y = {
					"filetype",
					"progress",
					{
						function()
							local reg = vim.fn.reg_recording()
							if reg == "" then
								return ""
							end -- not recording
							return "Recording @" .. reg
						end,
					},
				},
				lualine_z = {
					{ "location", left_padding = 2 },
					-- { "location", separator = { right = "" }, left_padding = 2 },
				},
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			tabline = {},
			extensions = {},
		})
	end,
}
