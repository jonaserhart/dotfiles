local M = {}

function M.setup()
  local lspconfig = require("lspconfig")
  local capabilities = require('blink.cmp').get_lsp_capabilities()

  lspconfig.lua_ls.setup({
    capabilities = capabilities,
  })
end

return M
