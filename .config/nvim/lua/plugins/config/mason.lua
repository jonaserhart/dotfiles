return {
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup({
      ensure_installed = { "goimports", "gofumpt", "gomodifytags", "impl" },
    })
  end,
}
