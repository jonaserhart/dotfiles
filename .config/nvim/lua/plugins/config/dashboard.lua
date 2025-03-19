return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    local version = vim.version()
    local version_string = string.format("NeoVim v%s.%s.%s", version.major, version.minor, version.patch)
    local custom_actions = require("config.utils").get_custom_config("custom_dashboard_actions", {})

    local center = {
      {
        icon = " ",
        icon_hl = "Title",
        desc = "Open a workspace",
        desc_hl = "String",
        key_hl = "Number",
        action = "Telescope workspaces",
        key = "w",
        key_format = " %s",
      },
      {
        icon = "󰃭 ",
        icon_hl = "Title",
        desc = "Agenda",
        desc_hl = "String",
        key_hl = "Number",
        action = "AgendaWeek",
        key = "a",
        key_format = " %s",
      },
      table.unpack(custom_actions),
      {
        icon = " ",
        icon_hl = "Title",
        desc = "Orgfiles",
        desc_hl = "String",
        key_hl = "Number",
        action = "WorkspacesOpen orgfiles",
        key = "o",
        key_format = " %s",
      },
      {
        icon = " ",
        icon_hl = "Title",
        desc = "Settings",
        desc_hl = "String",
        key_hl = "Number",
        action = "WorkspacesOpen nvim",
        key = "c",
        key_format = " %s",
      },
    }

    require("dashboard").setup({
      theme = "doom",
      config = {
        header = {
          "",
          "",
          "",
          "",
          version_string,
          "",
          os.date("󰥔  %d. %m. %Y %H:%M:%S"),
          "",
          "",
          "",
        },
        center = center,
      },
    })
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
