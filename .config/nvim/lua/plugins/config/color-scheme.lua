return {
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd('colorscheme github_dark')
    end,
  },
  {
    "AlexvZyl/nordic.nvim",
    priority = 1000,
    config = function()
      require("nordic").setup({})
      -- vim.cmd("colorscheme nordic")
    end,
  },
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require("onedark").setup()

      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          -- Set folder and file icon colors
          vim.api.nvim_set_hl(0, "NeoTreeFileIcon", { fg = "#A9AFBC" })
          vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#A9AFBC" })
          vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { link = "Normal" })
          vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "#2F343E" })
          vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#2F343E" })
          vim.api.nvim_set_hl(0, "DevIconDefault", { fg = "#A9AFBC" })
        end,
      })
      vim.cmd("colorscheme onedark")
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
      require("posterpole").setup({})
      -- vim.cmd("colorscheme posterpole")
    end,
  },
  {
    "shawilly/ponokai",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme('ponokai')
    end,
  },
  {
    "olivercederborg/poimandres.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("poimandres").setup({
        -- vim.cmd("colorscheme poimandres")
      })
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
      require("vague").setup({})
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      -- vim.cmd("colorscheme tokyonight-storm")
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        no_italic = true,
        term_colors = true,
        transparent_background = true,
        color_overrides = {},
        integrations = {
          telescope = true,
          native_lsp = true,
          treesitter = true,
          gitsigns = true,
          neotree = true,
          cmp = true,
          markdown = true,
        },
      })
      -- vim.cmd("colorscheme catppuccin")
    end,
  },
  {
    "philosofonusus/morta.nvim",
    name = "morta",
    priority = 1000,
    opts = {},
    config = function()
      -- vim.cmd.colorscheme 'morta'
    end,
  },
  {
    "Mofiqul/vscode.nvim",
    name = "vscode",
    priority = 1000,
    opts = {},
    config = function()
      -- vim.cmd.colorscheme 'vscode'
    end,
  },
}
