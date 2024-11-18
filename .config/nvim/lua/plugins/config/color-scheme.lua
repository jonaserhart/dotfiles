return {
  "AlexvZyl/nordic.nvim", 
  priority = 1000,
  config = function()
    require("nordic").setup({
      on_palette = function(palette)
        palette.gray2 = "#586580"
        palette.gray4 = "#586580"
      end,
      transparent = {
        -- Enable transparent background.
        bg = true,
        float = true
      },
    })
    vim.cmd("colorscheme nordic")
  end,
}
