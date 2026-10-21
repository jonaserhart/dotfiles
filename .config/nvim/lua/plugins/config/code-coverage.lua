return {
  "andythigpen/nvim-coverage",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>tc", "<cmd>CoverageToggle<cr>", desc = "Toggle coverage" },
    { "<leader>tC", "<cmd>CoverageSummary<cr>", desc = "Coverage summary" },
    { "<leader>tl", "<cmd>CoverageLoad<cr>",   desc = "Load coverage" },
  },
  config = function()
    require("coverage").setup({
      auto_reload = true,
      auto_reload_timeout_ms = 500,
      signs = {
        covered  = { hl = "CoverageCovered",  text = "▎" },
        uncovered = { hl = "CoverageUncovered", text = "▎" },
        partial  = { hl = "CoveragePartial",  text = "▎" },
      },
      lang = {
        go = {
          coverage_file = vim.fn.getcwd() .. "/cover.out",
        },
      },
    })
  end,
}
