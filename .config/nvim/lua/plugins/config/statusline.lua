return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local trouble = require("trouble")
    local symbols = trouble.statusline({
      mode = "lsp_document_symbols",
      groups = {},
      title = false,
      filter = { range = true },
      format = "{kind_icon}{symbol.name:Normal}",
    })

    require("lualine").setup({
      options = {
        theme = "auto",
      },
      sections = {
        lualine_c = {
          {
            symbols.get,
            cond = symbols.has
          }
        }
      }
    })
  end,
}
