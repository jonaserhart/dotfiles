return {
  -- UI & color scheme
  { "akinsho/bufferline.nvim",                 import = "plugins.config.bufferline" },
  { "AlexvZyl/nordic.nvim",                    import = "plugins.config.color-scheme" },
  { "nvimdev/dashboard-nvim",                  import = "plugins.config.dashboard" },
  { "RRethy/vim-illuminate",                   import = "plugins.config.illuminate" },
  { "nvim-lualine/lualine.nvim",               import = "plugins.config.statusline" },
  { "rcarriga/nvim-notify",                    import = "plugins.config.notify" },
  { "nvim-neo-tree/neo-tree.nvim",             import = "plugins.config.tree" },
  { "nvim-telescope/telescope.nvim",           import = "plugins.config.telescope" },
  { "nvim-telescope/telescope-ui-select.nvim", import = "plugins.config.telescope-ui-select" },
  { "folke/trouble.nvim",                      import = "plugins.config.trouble" },
  { "folke/edgy.nvim",                         import = "plugins.config.edgy" },
  { "folke/todo-comments.nvim",                import = "plugins.config.todo" },
  { "s1n7ax/nvim-window-picker",               import = "plugins.config.windowpicker" },
  { "OXY2DEV/markview.nvim",                   import = "plugins.config.markdown-preview" },
  { "nvim-tree/nvim-web-devicons",             import = "plugins.config.icons" },
  { "mvllow/modes.nvim",                       import = "plugins.config.modes" },
  -- { "lukas-reineke/indent-blankline.nvim",     import = "plugins.config.blankline" },
  -- { "nvim-treesitter/nvim-treesitter-context",         import = "plugins.config.treesitter-context" },

  -- Completion
  { "saghen/blink.cmp",                        import = "plugins.config.completions" },
  { "windwp/nvim-autopairs",                   import = "plugins.config.autopairs" },

  -- Core LSP, DAP and Testing frameworks
  { "neovim/nvim-lspconfig",                   import = "plugins.config.lsp" },
  { "nvim-neotest/neotest",                    import = "plugins.config.testing" },
  { "andythigpen/nvim-coverage",               import = "plugins.config.code-coverage" },
  { "mfussenegger/nvim-dap",                   import = "plugins.config.debug" },
  { "williamboman/mason-lspconfig.nvim",       import = "plugins.config.mason-lspconfig" },
  { "nvimdev/lspsaga.nvim",                    import = "plugins.config.lspsaga" },
  { "sonarlint.nvim",                          import = "plugins.config.sonar" },

  -- Formatting
  { "nvim-treesitter/nvim-treesitter",         import = "plugins.config.treesitter" },

  -- Version control
  { "sindrets/diffview.nvim",                  import = "plugins.config.diffview" },
  { "lewis6991/gitsigns.nvim",                 import = "plugins.config.gitsigns" },
  { "FabijanZulj/blame.nvim",                  import = "plugins.config.blame" },
  { "NeogitOrg/neogit",                        import = "plugins.config.neogit" },

  -- Binaries
  { "williamboman/mason.nvim",                 import = "plugins.config.mason" },
  { "nvimtools/none-ls.nvim",                  import = "plugins.config.null-ls" },

  -- Organization
  { "nvim-orgmode/orgmode",                    import = "plugins.config.org" },
  { "natecraddock/workspaces.nvim",            import = "plugins.config.workspaces" },
  { "duckdm/neowarrior.nvim",                  import = "plugins.config.taskwarrior" },

  -- Terminal
  { "akinsho/toggleterm.nvim",                 import = "plugins.config.terminal" },
  { "voldikss/vim-floaterm" },

  -- Util
  { "willothy/wezterm.nvim",                   import = "plugins.config.wezterm" },
}
