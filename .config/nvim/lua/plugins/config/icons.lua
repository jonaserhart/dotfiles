return {
  "nvim-tree/nvim-web-devicons",
  lazy = false,
  config = function()
    require("nvim-web-devicons").setup({
      override = {
        default_icon = {
          icon = "",
          name = "Default",
          color = "#A9AFBC",
        },
        go = {
          icon = " ",
          color = "#7dcfff",
          name = "Go",
        },
      },
      color_icons = true,
      override_by_filename = {},
      override_by_extension = {},
    })
  end,
}
