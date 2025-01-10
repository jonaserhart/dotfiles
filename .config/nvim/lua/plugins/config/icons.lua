return {
  "nvim-tree/nvim-web-devicons",
  priority = 1000,
  config = function()
    require("nvim-web-devicons").setup({
      -- override = {
      --   default_icon = {
      --     icon = "",
      --     name = "Default",
      --     color = "#A9AFBC",
      --   },
      --   go = {
      --     icon = "",
      --     color = "#7dcfff",
      --     name = "Go",
      --   },
      -- },
      default = true,
      color_icons = true,
      strict = true,
      override_by_filename = {},
      override_by_extension = {},
    })
  end
}
