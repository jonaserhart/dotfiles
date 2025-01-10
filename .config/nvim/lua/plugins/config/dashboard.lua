return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    local version = vim.version()
    local versionString = string.format("NeoVim v%s.%s.%s", version.major, version.minor, version.patch)
    require("dashboard").setup({
      theme = "doom",
      config = {
        header = {
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          "",
          versionString,
          "",
          os.date("󰥔  %d. %m. %Y %H:%M:%S"),
          "",
          "",
          "",
        },
        center = {
          {
            icon = " ",
            icon_hl = "Title",
            desc = "Open a workspace",
            desc_hl = "String",
            key_hl = "Number",
            action = "WorkspacesOpen",
            key = "w",
            key_format = ' %s'
            -- keymap = "w",
          },
          {
            icon = " ",
            icon_hl = "Title",
            desc = "Settings",
            desc_hl = "String",
            key_hl = "Number",
            action = "WorkspacesOpen nvim",
            key = "c",
            key_format = ' %s'
            -- keymap = "c",
          },
        },
      }
    })
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
