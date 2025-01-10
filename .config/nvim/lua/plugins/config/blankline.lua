return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = {
      char = "│",
      highlight = "LineNr",
    },
    exclude = {
      filetypes = { "dashboard", "neo-tree" }
    },
    scope = {
      enabled = true,
      show_start = false,
      show_end = false,
    },
  },
}
