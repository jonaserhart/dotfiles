return {
  "williamboman/mason-lspconfig.nvim",
  enabled = false,
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "gopls",
        "golangci_lint_ls",
        "bashls",
        "vtsls",
      },
    })
  end,
}
