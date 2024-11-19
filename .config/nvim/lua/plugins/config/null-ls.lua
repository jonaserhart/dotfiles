return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    -- Custom code actions
    require("plugins.languages.go.config.code-actions").setup()

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
      }
    })
  end
}

