local M = {}

function M.setup()
  local ok, neotest = pcall(require, "neotest")
  if not ok then
    return
  end

  local neotest_golang = require("neotest-golang")

  neotest.setup({
    adapters = {
      neotest_golang({
        args = {},
        experimental = {
          test_table = true,
        },
        frameworks = {
          "golang",
          "ginkgo",
        },
      }),
    },
  })
end

return M
