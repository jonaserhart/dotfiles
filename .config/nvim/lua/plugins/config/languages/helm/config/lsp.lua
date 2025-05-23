local M = {}

function M.setup()
  local configs = require('lspconfig.configs')
  local util = require('lspconfig.util')

  if not configs.helm_ls then
    configs.helm_ls = {
      default_config = {
        cmd = { "helm_ls", "serve" },
        filetypes = { 'helm' },
        root_dir = function(fname)
          return util.root_pattern('Chart.yaml')(fname)
        end,
      },
    }
  end
  local lsp = require('lspconfig')
  lsp.helm_ls.setup {
    filetypes = { "helm" },
    cmd = { "helm_ls", "serve" },
  }
end

return M
