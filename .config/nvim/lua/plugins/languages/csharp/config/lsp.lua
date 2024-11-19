local M = {}

function M.setup()
  local lspconfig = require("lspconfig")
  local capabilities = require("cmp_nvim_lsp").default_capabilities()

  lspconfig.csharp_ls.setup({
    capabilities = capabilities,
  })
end

return M
