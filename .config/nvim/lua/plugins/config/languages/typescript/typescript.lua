local M = {}

function M.setup()
  require("plugins.config.languages.typescript.config.code-actions").setup()
  require("plugins.config.languages.typescript.config.diagnostics").setup()
  require("plugins.config.languages.typescript.config.formatting").setup()
  require("plugins.config.languages.typescript.config.lsp").setup()
end

return M
