return {
  "stevearc/conform.nvim",  
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "goimports", "gofumpt" },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
    })
  end
}
