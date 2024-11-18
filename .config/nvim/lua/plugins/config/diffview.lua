return {
  "sindrets/diffview.nvim", 
  config = function()
    require("diffview").setup()

    local function openfilediffview()
      local currentfile = vim.fn.expand('%:p')
      vim.cmd(":DiffviewFileHistory \"" .. currentfile .. "\"")
    end

    vim.keymap.set("n", "<leader>df", openfilediffview, {})
    vim.keymap.set("n", "<leader>dx", ":DiffviewClose<CR>", {})
    vim.keymap.set("n", "<leader>dO", ":DiffviewOpen<CR>", {})
  end
}
