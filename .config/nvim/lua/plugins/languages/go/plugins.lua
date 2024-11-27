return {
  {
    "leoluz/nvim-dap-go",
    config = function()
      -- DAP
      require("plugins.languages.go.config.dap").setup()
    end
  },
  {
    "hexdigest/gounit-vim"
  }
}
