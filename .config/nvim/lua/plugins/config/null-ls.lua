return {
  "nvimtools/none-ls.nvim",
  dependencies = { "nvimtools/none-ls-extras.nvim" },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup()

    local diagnostics = null_ls.builtins.diagnostics

    null_ls.register({
      null_ls.builtins.code_actions.gomodifytags,
      null_ls.builtins.code_actions.impl,
      null_ls.builtins.formatting.prettier,
      diagnostics.semgrep,
    })
  end,
}
