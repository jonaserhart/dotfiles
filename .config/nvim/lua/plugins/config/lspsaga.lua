return {
  "nvimdev/lspsaga.nvim",
  config = function()
    require("lspsaga").setup({
      ui = {
        border = "none",
      },
      lightbulb = {
        -- enable = false
        virtual_text = false,
      },
      implement = {
        enable = true,
        sign = true,
        virtual_text = true,
        priority = 100,
      },
    })

    vim.keymap.set("n", "<leader>ic", ":Lspsaga incoming_calls<cr>", {})
    vim.keymap.set({ "n", "v" }, "<leader>ca", ":Lspsaga code_action<cr>", {})
    vim.keymap.set("n", "<leader>gd", ":Lspsaga goto_definition<cr>", {})
    vim.keymap.set("n", "<leader>pd", ":Lspsaga peek_definition<cr>", {})
    vim.keymap.set("n", "<leader>ptd", ":Lspsaga peek_type_definition<cr>", {})
    vim.keymap.set("n", "<leader>dne", ":Lspsaga diagnostic_jump_next<cr>", {})
    vim.keymap.set("n", "<leader>dpe", ":Lspsaga diagnostic_jump_prev<cr>", {})
    vim.keymap.set("n", "K", ":Lspsaga hover_doc<cr>", {})
    vim.keymap.set("n", "<leader>gi", ":Lspsaga finder imp<cr>", {})
    vim.keymap.set("n", "<leader>gr", ":Lspsaga finder ref<cr>", {})
    vim.keymap.set("n", "<leader>so", ":Lspsaga outline<cr>", {})
    vim.keymap.set("n", "<leader>rn", ":Lspsaga rename<cr>", {})
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
}
