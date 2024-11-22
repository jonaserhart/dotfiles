return {
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup({
        diagnostic = true,
  null_ls = {           -- set to false to disable null-ls setup
    golangci_lint = {
      method = {"NULL_LS_DIAGNOSTICS_ON_SAVE", "NULL_LS_DIAGNOSTICS_ON_OPEN", "NULL_LS_DIAGNOSTICS"}, -- when it should run
      enable = {'govet', 'ineffassign','revive', 'gosimple'}, -- linters to enable; empty by default
      severity = vim.diagnostic.severity.INFO, -- severity level of the diagnostics
    },
  },
      })
      local format_sync_grp = vim.api.nvim_create_augroup("goimports", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          require('go.format').goimports()
        end,
        group = format_sync_grp,
      })
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
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
  },
  {
    "hexdigest/gounit-vim"
  }
}
