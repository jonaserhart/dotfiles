return {
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
      vim.cmd("colorscheme catppuccin-frappe")
    end
  }
}
