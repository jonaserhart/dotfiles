return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvimtools/none-ls-extras.nvim" },
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(client)
									if client.name == "vtsls" then
										-- local warning = "Ignoring tsserver formatting. See formatit function in keymap.lua to change this."
										-- vim.notify(warning)
										return false
									end
									return true
								end,
							})
						end,
					})
				end
			end,
		})

		-- common builtins
		null_ls.register({
			null_ls.builtins.diagnostics.semgrep,
		})
	end,
}
