return {
  "mvllow/modes.nvim",
  tag = "v0.2.1",
  config = function()
    require("modes").setup({
      colors = {
        bg = "",
        copy = "#f5c359",
        delete = "#c75c6a",
        insert = "#78ccc5",
        visual = "#89cff0",
      },

      -- Set opacity for cursorline and number background
      line_opacity = 0.15,

      -- Enable cursor highlights
      set_cursor = true,

      -- Enable cursorline initially, and disable cursorline for inactive windows
      -- or ignored filetypes
      set_cursorline = false,

      ignore_filetypes = { "NvimTree", "TelescopePrompt" },
    })
  end,
}
