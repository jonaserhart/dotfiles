local M = {}

function M.setup()
  local null_ls = require("null-ls")

  null_ls.register({
      require("none-ls.diagnostics.eslint_d").with({ -- requires none-ls-extras.nvim
        --args = {"--env", "es6"},
        filter = function(diagnostic)
          -- ignore prettier warnings from eslint-plugin-prettier
          return diagnostic.code ~= "prettier/prettier"
        end,
      }),
  })
end

return M
