return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    -- TODO: test
    highlight = {
      pattern = [[.*<(KEYWORDS)>\s*:?\(?]], -- pattern or table of patterns, used for highlighting (vim regex)
    },
    gui_style = {
      fg = "NONE",
      bg = "BOLD",
    },
    search = {
      pattern = [[\/\/\s*\b(KEYWORDS):?]],
    },
  }
}
