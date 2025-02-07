local M = {}

function M.setup()
  local lspconfig = require("lspconfig")
  local capabilities = require('blink.cmp').get_lsp_capabilities()

  lspconfig.ts_ls.setup({
    capabilities = capabilities,
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },
  })
end

return M
