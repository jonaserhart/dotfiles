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
  { "EdenEast/nightfox.nvim" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        term_colors = false,
        color_overrides = {
          all = {
            rosewater = "#f5e0dc",
            flamingo = "#f2cdcd",
            pink = "#f5c2e7",
            mauve = "#b477cf",
            red = "#CF7277",
            maroon = "#acb2be",
            peach = "#dfc184",
            yellow = "#6eb4bf",
            green = "#a1c181",
            teal = "#94e2d5",
            sky = "#89dceb",
            sapphire = "#74c7ec",
            blue = "#6798cb",
            lavender = "#acb2be",
            text = "#acb2be",
            subtext1 = "#5d636f",
            subtext0 = "#5d636f",
            overlay2 = "#5d636f",
            overlay1 = "#5d636f",
            overlay0 = "#5d636f",
            surface2 = "#454a56",
            surface1 = "#454a56",
            surface0 = "#454a56",
            base = "#282c33",
            mantle = "#2f343e",
            crust = "#11111b",
          },
        },
      })
      vim.cmd("colorscheme catppuccin-frappe")
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
