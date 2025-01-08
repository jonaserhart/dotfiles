local M = {}

function M.setup()
  -- lsp
  require("plugins.config.languages.helm.config.lsp").setup()
end

return M
