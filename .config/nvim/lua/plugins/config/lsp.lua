return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.keymap.set("n", "<leader>tgr", ":Telescope lsp_references<cr>", {})
    vim.keymap.set("n", "<leader>tgi", ":Telescope lsp_implementations<cr>", {})
    vim.keymap.set("n", "<leader>tgT", ":Telescope lsp_type_definitions<cr>", {})
  end,
}
