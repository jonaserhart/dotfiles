local M = {}

function M.setup()
  local null_ls = require("null-ls")

  null_ls.register({
    name = "js_ts_code_actions",
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
      "vue",
      "svelte",
      "astro"
    },
    sources = {
      require("none-ls.code_actions.eslint_d")
    }
  })
end

return M
