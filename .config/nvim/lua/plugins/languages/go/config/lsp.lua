local M = {}

function M.setup()
  local lspconfig = require("lspconfig")
  local capabilities = require("cmp_nvim_lsp").default_capabilities()


  capabilities.textDocument = vim.tbl_deep_extend("force", capabilities.textDocument or {}, {
    codeAction = {
      dynamicRegistration = true,
      resolveSupport = {
        properties = {
          "edit",
          "description",
          "kind",
        }
      }
    }
  })

  lspconfig.gopls.setup({
    capabilities = capabilities,
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
        codelenses = {
          generate = true,
          gc_details = true,
          test = true,
          tidy = true,
          regenerate_cgo = true,
        },
        staticcheck = true,
        gofumpt = true,
        vulncheck = "Imports",
        usePlaceholders = true,
      },
    },
  })
end

return M
