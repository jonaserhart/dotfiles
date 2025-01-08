local M = {}

function M.setup()
  local lsp = require('lspconfig')
  lsp.yamlls.setup {
  }
end

return M
