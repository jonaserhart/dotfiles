local M = {}

function M.setup_signs()
  -- DAP Symbols
  vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpointLine" })
  vim.fn.sign_define("DapBreakpointCondition", { text = " ﳁ", texthl = "DapBreakpoint" })
  vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpoint" })
  vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint" })
  vim.fn.sign_define(
    "DapStopped",
    { text = "", texthl = "DapStopped", numhl = "DapStopped", linehl = "DapStopped" }
  )
end

return M
