return {
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- vim.cmd('colorscheme github_dark')
    end,
  },
  {
    "AlexvZyl/nordic.nvim",
    priority = 1000,
    config = function()
      require("nordic").setup({
      })
      -- vim.cmd("colorscheme nordic")
    end,
  },
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    config = function()
      require("onedarkpro").setup()
      -- vim.cmd("colorscheme onedark")
    end,
  },
  {
    "neanias/everforest-nvim",
    priority = 1000,
    config = function()
      require("everforest").setup()
      -- vim.cmd("colorscheme everforest")
    end,
  },
  {
    "ilof2/posterpole.nvim",
    priority = 1000,
    config = function()
      require("posterpole").setup({
      })
      -- vim.cmd("colorscheme posterpole")
    end
  },
  {
    'shawilly/ponokai',
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme('ponokai')
    end
  },
  {
    'olivercederborg/poimandres.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('poimandres').setup {
        -- vim.cmd("colorscheme poimandres")
      }
    end,
  },
  {
    "briones-gabriel/darcula-solid.nvim",
    dependencies = {
      "rktjmp/lush.nvim",
    },
    lazy = false,
    priority = 1000,
  },
  {
    "vague2k/vague.nvim",
    config = function()
      require("vague").setup({
      })
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- vim.cmd("colorscheme tokyonight-storm")
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        no_italic = true,
        term_colors = true,
        transparent_background = false,
        styles = {
          comments = {},
          conditionals = {},
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
        },
        color_overrides = {
          mocha = {
            base = "#000000",
            mantle = "#000000",
            crust = "#000000",
          }
        },
        integrations = {
          telescope = {
            enabled = true,
            style = "nvchad",
          },
          dropbar = {
            enabled = true,
            color_mode = true,
          },
        },
      })
      vim.cmd("colorscheme catppuccin")
    end
  },
  {
    "philosofonusus/morta.nvim",
    name = 'morta',
    priority = 1000,
    opts = {},
    config = function()
      -- vim.cmd.colorscheme 'morta'
    end,
  },
  {
    "Mofiqul/vscode.nvim",
    name = 'vscode',
    priority = 1000,
    opts = {},
    config = function()
      -- vim.cmd.colorscheme 'vscode'
    end,
  }
}
