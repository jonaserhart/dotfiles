local M = {}

function M.setup()
  local null_ls = require("null-ls")

  null_ls.register({
    name = "lua_formatting",
    filetypes = { "lua" },
    sources = {
      null_ls.builtins.formatting.stylua,
    }
  })
end

return M
