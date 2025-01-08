local M = {}

function M.setup()
  require("plugins.config.languages.yaml.config.lsp").setup()
end

return M
