return {
  "folke/edgy.nvim",
  event = "VeryLazy",
  init = function()
    vim.opt.laststatus = 3
    vim.opt.splitkeep = "screen"
  end,
  opts = {
    bottom = {
      {
        ft = "toggleterm",
        size = { height = 0.4 },
        -- exclude floating windows
        filter = function(buf, win)
          return vim.api.nvim_win_get_config(win).relative == ""
        end,
      },
      { ft = "qf", title = "QuickFix" },
      {
        ft = "help",
        size = { height = 20 },
        -- only show help buffers
        filter = function(buf)
          return vim.bo[buf].buftype == "help"
        end,
      },
      {
        size = { height = 0.4 },
        ft = "trouble",
      },
      {
        title = "Debug console",
        ft = "dap-repl",
        size = { height = 0.33 },
      },
      {
        title = "Locals",
        ft = "dapui_scopes",
        size = { height = 0.33 },
      },
    },
    left = {
      -- Neo-tree filesystem always takes half the screen height
      {
        title = "Neo-Tree",
        ft = "neo-tree",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "filesystem"
        end,
        size = { height = 0.5, width = 0.15 },
      },
      {
        title = "Neo-Tree Git",
        ft = "neo-tree",
        filter = function(buf)
          return vim.b[buf].neo_tree_source == "git_status"
        end,
        open = "Neotree git_status reveal left",
        size = { height = 0.5, width = 0.15 },
      },
      "neo-tree",
      {
        title = "Watches",
        ft = "dapui_watches",
        size = { width = 0.15 },
      },
      {
        title = "Stacks",
        ft = "dapui_stacks",
        size = { width = 0.15 },
      },
      {
        title = "Breakpoints",
        ft = "dapui_breakpoints",
        size = { width = 0.15 },
      }
    },
    right = {
      {
        title = "Tests",
        ft = "neotest-summary",
        open = "Neotest summary open",
        size = { width = 0.25 },
      },
      {
        title = "Symbols",
        ft = "sagaoutline",
        open = "Lspsaga outline"
      },
    }
  },
}
