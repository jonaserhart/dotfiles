local M = {}

function M.setup()
  require("plugins.config.languages.bash.config.lsp").setup()
end

return M
