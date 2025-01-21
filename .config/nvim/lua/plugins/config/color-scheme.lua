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
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
    config = function()
      local colors = {
        -- Base colors
        bg = "#282C33",
        fg = "#acb2be",
        bg_highlight = "#363c46",

        -- Syntax colors
        purple = "#ab7aca", -- keywords
        blue = "#73ade9",   -- functions
        cyan = "#6eb4bf",   -- types
        green = "#a1c181",  -- strings
        white = "#c8ccd4",  -- variables, constants, fields, parameters
        comment = "#979aa1",

        line_nr = "#838994",        -- Based on tab.inactiveForeground
        cursor_line_bg = "#2f343e", -- Based on sideBar.background
        visual_bg = "#454a56",      -- list.activeSelectionBackground
      }
      require("onedarkpro").setup({
        colors = colors, -- Our custom colors
        highlights = {
          -- Basic highlights
          Comment = { fg = "${comment}" },
          String = { fg = "${green}" },
          Keyword = { fg = "${purple}" },
          Type = { fg = "${cyan}" },
          Function = { fg = "${blue}" },
          Operator = { fg = "${cyan}" },

          -- TreeSitter highlights
          ["@variable"] = { fg = "${white}" },           -- Variable names
          ["@variable.parameter"] = { fg = "${white}" }, -- Variable names
          ["@variable.builtin"] = { fg = "${white}" },   -- Built-in variables
          ["@constant"] = { fg = "${white}" },           -- Constants
          ["@constant.builtin"] = { fg = "${white}" },   -- Built-in constants
          ["@parameter"] = { fg = "${white}" },          -- Parameters
          ["@field"] = { fg = "${white}" },              -- Struct fields
          ["@property"] = { fg = "${white}" },           -- Object properties
          ["@function"] = { fg = "${blue}" },            -- Functions
          ["@function.call"] = { fg = "${blue}" },       -- Function calls
          ["@keyword"] = { fg = "${purple}" },           -- Keywords
          ["@keyword.function"] = { fg = "${purple}" },  -- Function keyword
          ["@type"] = { fg = "${cyan}" },                -- Types
          ["@type.builtin"] = { fg = "${cyan}" },        -- Built-in types
          ["@namespace"] = { fg = "${white}" },          -- Packages and namespaces
          ["@string"] = { fg = "${green}" },             -- Strings
          ["@module"] = { fg = "${white}" },             -- Package identifiers like 'cmp'
          ["@field.definition"] = { fg = "${white}" },   -- Field definitions in structs
          ["@property.go"] = { fg = "${white}" },        -- Properties in Go
          ["@receiver"] = { fg = "${white}" },           -- Method receivers in Go
          ["@type.builtin.go"] = { fg = "${cyan}" },     -- Types
          ["@variable.member"] = { fg = "${white}" },    -- Struct members
          ["@lsp.type.property"] = { fg = "${white}" },  -- LSP property hints
          ["@lsp.type.parameter"] = { fg = "${white}" }, -- LSP parameter hints
          ["@lsp.type.variable"] = { fg = "${white}" },  -- LSP variable hints
          ["@lsp.type.member"] = { fg = "${white}" },    -- LSP member hints

          -- Go-specific syntax
          goField = { fg = "${white}" },
          goTypeConstructor = { fg = "${cyan}" },
          goTypeName = { fg = "${cyan}" },
          goPackageName = { fg = "${white}" },
          goReceiverType = { fg = "${white}" },

          -- Go-specific TreeSitter highlights
          ["@type.go"] = { fg = "${cyan}" },
          ["@variable.go"] = { fg = "${white}" },
          ["@field.go"] = { fg = "${white}" },
          ["@constant.go"] = { fg = "${white}" },
          ["@parameter.go"] = { fg = "${white}" },
          ["@function.go"] = { fg = "${blue}" },
          ["@namespace.go"] = { fg = "${white}" },

          -- UI elements
          Normal = { fg = "${fg}", bg = "${bg}" },
          SignColumn = { bg = "${bg}" },
          StatusLine = { fg = "${white}", bg = "#3b414d" },
          StatusLineNC = { fg = "${line_nr}", bg = "#3b414d" },
          VertSplit = { fg = "#464b57" },
          TabLine = { fg = "${line_nr}", bg = "#2f343e" },
          TabLineSel = { fg = "${white}", bg = "#202427" },
          TabLineFill = { bg = "#2f343e" },
          CursorLineNr = { fg = "#495162", bg = "#2d313b" },
          IblScope = { link = "CursorLineNr" },
          Cursor = { fg = "#000000", bg = "#73ADE8" },
          EdgyNormal = { bg = "#2F343E", fg = "#acb2be" },
        },
        options = {
          cursorline = true,
          transparency = false,
        },
      })
      vim.cmd("colorscheme onedark")
    end,
  },
  -- {
  --   "navarasu/onedark.nvim",
  --   priority = 1000,
  --   config = function()
  --     require("onedark").setup()
  --
  --     vim.api.nvim_create_autocmd("ColorScheme", {
  --       callback = function()
  --         -- Set folder and file icon colors
  --         vim.api.nvim_set_hl(0, "NeoTreeFileIcon", { fg = "#A9AFBC" })
  --         vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#A9AFBC" })
  --         vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { link = "EndOfBuffer" })
  --         vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "#2F343E" })
  --         vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "#2F343E" })
  --         vim.api.nvim_set_hl(0, "DevIconDefault", { fg = "#A9AFBC" })
  --         vim.api.nvim_set_hl(0, "NeoTreeGitUnstaged", { bg = "#2F343E", fg = "#FF6D6A" })
  --       end,
  --     })
  --     vim.cmd("colorscheme onedark")
  --   end,
  -- },
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
