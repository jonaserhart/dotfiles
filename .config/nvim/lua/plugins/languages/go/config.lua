local M = {}

function M.setup()
  -- LSP
  require("plugins.languages.go.lsp").setup()

  -- Test
  require("plugins.languages.go.testing").setup()

  -- DAP
  require("plugins.languages.go.dap").setup()

  -- Confifuration go.nvim
  require("go").setup({
    lsp_gofumpt = true,
    lsp_codelens = true,
    lsp_document_formatting = true,
    lsp_cfg = false,
    dap_debug = false,
  })
end

return M
