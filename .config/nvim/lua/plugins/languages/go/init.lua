return {
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("plugins.languages.go.config").setup()
    end,
    ft = { "go", "gomod", "gowork", "gosum" },
  },
  {
    "fredrikaverpil/neotest-golang",
    dependencies = {
      "nvim-neotest/neotest"
    },
  },
  {
    "leoluz/nvim-dap-go",
  }
}
