local M = {}

function M.setup()
  -- dap
  require("plugins.config.languages.csharp.config.dap").setup()
end

return M
