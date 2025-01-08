local M = {}

function M.setup()
  require("plugins.config.languages.lua.config.lsp").setup()
  require("plugins.config.languages.lua.config.formatting").setup()
end

return M
