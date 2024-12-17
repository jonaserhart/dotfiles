return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    highlight = {
    pattern = [[.*<(KEYWORDS)>\s*:?\(?]], -- pattern or table of patterns, used for highlighting (vim regex)
  },
search = {
    pattern = [[\/\/\s*\b(KEYWORDS):?]],
  },
  }
}
