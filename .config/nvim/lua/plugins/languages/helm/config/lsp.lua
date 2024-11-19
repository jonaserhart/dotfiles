local M = {}

function M.setup()
  local lspconfig = require("lspconfig")

  lspconfig.helm_ls.setup({
    settings = {
      ["helm-ls"] = {
        yamlls = {
          path = "yaml-language-server",
        },
      },
    },
  })
end

return M
