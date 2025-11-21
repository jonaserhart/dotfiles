local M = {}

function M.setup()
	-- lsp config
	vim.lsp.config("*", {
		capabilities = {
			textDocument = {
				semanticTokens = {
					multilineTokenSupport = true,
				},
			},
		},
		root_markers = { ".git" },
	})

	vim.lsp.enable({
		"golangci-lint",
		"gopls",
		"helm",
		"bash",
		"lua",
		"rust",
	})
end

return M
