return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    require("dashboard").setup({
      theme = "hyper",
      config = {
        week_header = {
          enable = true,
        },
        shortcut = {
          {
            desc = "  Agenda",
            group = "@property",
            action = "AgendaDay",
            key = "a"
          },
          {
            desc = "  Open a workspace",
            group = "Number",
            action = "WorkspacesOpen",
            key = "w",
          },
          {
            desc = "  Org",
            group = "@method",
            action = "Telescope orgmode search_headings",
            key = "n",
          },
        },
        packages = { enable = true },
        project = { enable = true, },
        mru = { enable = false },
        footer = {},
      },
    })
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
