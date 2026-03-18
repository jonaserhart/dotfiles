return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				-- first, run golang-ci-lint then run gopls lsp formatter in every case
				go = { "golangci" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
			},
      formatters = {
        ["golangci"] = {
          command = "golangci-lint",
          args = { "fmt", "--stdin"},
          stdin = true,
        },
      },
			format_on_save = {
				timeout_ms = 2000,
				lsp_format = "fallback",
			},
		})
	end,
}
