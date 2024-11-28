return {
  -- UI & color scheme
  { "akinsho/bufferline.nvim",                 import = "plugins.config.bufferline" },
  { "AlexvZyl/nordic.nvim",                    import = "plugins.config.color-scheme" },
  { "nvimdev/dashboard-nvim",                  import = "plugins.config.dashboard" },
  { "RRethy/vim-illuminate",                   import = "plugins.config.illuminate" },
  { "nvim-lualine/lualine.nvim",               import = "plugins.config.statusline" },
  { "rcarriga/nvim-notify",                    import = "plugins.config.notify" },
  { "nvim-neo-tree/neo-tree.nvim",             import = "plugins.config.tree" },
  { "filipdutescu/renamer.nvim",               import = "plugins.config.renamer" },
  { "nvim-telescope/telescope.nvim",           import = "plugins.config.telescope" },
  { "nvim-telescope/telescope-ui-select.nvim", import = "plugins.config.telescope-ui-select" },
  { "rachartier/tiny-code-action.nvim",        import = "plugins.config.tiny-code-action" },
  { "folke/trouble.nvim",                      import = "plugins.config.trouble" },
  { "folke/edgy.nvim",                         import = "plugins.config.edgy" },


  -- Completion
  { "hrsh7th/nvim-cmp",                        import = "plugins.config.completions" },

  -- Core LSP, DAP and Testing frameworks
  { "neovim/nvim-lspconfig",                   import = "plugins.config.lsp" },
  { "nvim-neotest/neotest",                    import = "plugins.config.testing" },
  { "andythigpen/nvim-coverage",               import = "plugins.config.code-coverage" },
  { "mfussenegger/nvim-dap",                   import = "plugins.config.debug" },
  { "williamboman/mason-lspconfig.nvim",       import = "plugins.config.mason-lspconfig" },
  { "ThePrimeagen/refactoring.nvim",           import = "plugins.config.refactoring" },

  -- Formatting
  { "nvim-treesitter/nvim-treesitter",         import = "plugins.config.treesitter" },

  -- Version control
  { "sindrets/diffview.nvim",                  import = "plugins.config.diffview" },
  { "lewis6991/gitsigns.nvim",                 import = "plugins.config.gitsigns" },
  { "FabijanZulj/blame.nvim",                  import = "plugins.config.blame" },

  -- Binaries
  { "williamboman/mason.nvim",                 import = "plugins.config.mason" },
  { "nvimtools/none-ls.nvim",                  import = "plugins.config.null-ls" },

  -- Org
  { "nvim-orgmode/orgmode",                    import = "plugins.config.org" },
  { "natecraddock/workspaces.nvim",            import = "plugins.config.workspaces" },

  -- Terminal
  { "akinsho/toggleterm.nvim",                 import = "plugins.config.terminal" },


  -- Language-specific
  { import = "plugins.languages.go.plugins" },
  { import = "plugins.languages.helm.plugins" },
}
