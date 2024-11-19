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
      -- Confifuration go.nvim
      require("go").setup({
        lsp_gofumpt = true,
        lsp_codelens = true,
        lsp_document_formatting = true,
        lsp_cfg = false,
        dap_debug = false,

      })
    end,
    ft = { "go", "gomod", "gowork", "gosum" },
  },
  {
    "fredrikaverpil/neotest-golang",
    dependencies = {
      "nvim-neotest/neotest"
    },
    config = function()
      -- Test
      require("plugins.languages.go.config.testing").setup()
    end
  },
  {
    "leoluz/nvim-dap-go",
    config = function()
      -- DAP
      require("plugins.languages.go.config.dap").setup()
    end
  }
}
