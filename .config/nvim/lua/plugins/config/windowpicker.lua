return {
  "s1n7ax/nvim-window-picker",
  name = "window-picker",
  event = "VeryLazy",
  config = function()
    require("window-picker").setup()
  end,
}
