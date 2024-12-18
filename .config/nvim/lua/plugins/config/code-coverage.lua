return {
  "andythigpen/nvim-coverage",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>tc", "<cmd>Coverage<cr>",                             desc = "Coverage in gutter" },
    { "<leader>tC", "<cmd>CoverageLoad<cr><cmd>CoverageSummary<cr>", desc = "Coverage summary" },
  },
  config = function()
    require("coverage").setup()
  end,
}
