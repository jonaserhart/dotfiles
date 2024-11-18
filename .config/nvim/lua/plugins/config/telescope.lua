return {
  "nvim-telescope/telescope.nvim",
    tag = '0.1.8',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'jonarrien/telescope-cmdline.nvim' },
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        version = "^1.0.0",
      },
      { "nvim-orgmode/telescope-orgmode.nvim", }
    },
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("cmdline")
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<C-p>', builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
      vim.keymap.set('n', '<leader>ls', builtin.lsp_document_symbols, {})
      vim.keymap.set('n', '<leader>lw', builtin.lsp_dynamic_workspace_symbols, {})
      vim.keymap.set('n', '<leader><leader>', ':Telescope cmdline<CR>', { noremap = true, desc = 'Cmdline' })
      vim.keymap.set('n', '<leader>tb', ':Telescope buffers<CR>', { noremap = true, desc = 'Cmdline' })
    end
}
