return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    require("nvim-web-devicons").setup({
      override = {
        -- This will force ALL icons to use #A9AFBC
        default_icon = {
          icon = "",
          name = "Default",
          color = "#A9AFBC",
        },
      },
      default = true,
      color_icons = false,
      strict = true,
      override_by_filename = {},
      override_by_extension = {},
    })
  end,
}
