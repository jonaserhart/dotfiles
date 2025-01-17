return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",

    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("neogit").setup({})

    vim.api.nvim_set_keymap("n", "<leader>vc", ":Neogit kind=vsplit<CR>", { noremap = true, silent = true })
  end,
}
