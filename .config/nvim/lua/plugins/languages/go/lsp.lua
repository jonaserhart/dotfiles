local M = {}

function M.setup()
  local lspconfig = require("lspconfig")

  lspconfig.gopls.setup({
    settings = {
      gopls = {
        experimentalPostfixCompletions = true,
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        },
        staticcheck = true,
        gofumpt = true,
        vulncheck = "imports",
        usePlaceholders = true,
      },
    },
  })
end

return M
