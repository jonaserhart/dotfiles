return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        offsets = {
          {
            filetype = "neo-tree",
            text = function()
              return vim.fn.getcwd()
            end,
            highlight = "Directory",
            text_align = "left"
          },
        },
        diagnostics = "nvim_lsp",
        separator_style = { "", "" },
        modified_icon = "●",
        show_close_icon = false,
        show_buffer_close_icons = false,
      },
    })

    vim.keymap.set("n", "<leader>an", ":BufferLineCycleNext<cr>", {})
    vim.keymap.set("n", "<leader>ap", ":BufferLineCyclePrev<cr>", {})
    vim.keymap.set("n", "<leader>aT", ":BufferLineCloseOthers<cr>", {})
    vim.keymap.set("n", "<leader>aa", ":BufferLinePick<cr>", {})
    vim.keymap.set("n", "<leader>ac", ":BufferLinePickClose<cr>", {})

    vim.keymap.set("n", "<leader>aq", function()
      local bufcount = #vim.fn.getbufinfo({ buflisted = 1 })
      local current_buf = vim.api.nvim_get_current_buf()

      if bufcount == 1 then
        vim.cmd("enew")
        vim.cmd("bdelete " .. current_buf)
      else
        vim.cmd("BufferLineCycleNext")
        vim.cmd("bdelete " .. current_buf)
      end
    end, { desc = "Close buffer and switch to next/new" })
  end,
}
