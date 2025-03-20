return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "jonarrien/telescope-cmdline.nvim" },
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      version = "^1.0.0",
    },
    { "nvim-orgmode/telescope-orgmode.nvim" },
  },
  opts = {
    defaults = {
      borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
      layout_strategy = "vertical",
      layout_config = {
        prompt_position = "top",
        height = 0.9,
        width = 0.9,
      },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("cmdline")
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<C-p>", builtin.find_files, { noremap = true, desc = "Find files" })
    vim.keymap.set(
      "n",
      "<leader>fg",
      ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
      { noremap = true, desc = "Search workspace" }
    )
    vim.keymap.set(
      "n",
      "<leader>ff",
      ": Telescope current_buffer_fuzzy_find<CR>",
      { noremap = true, desc = "Search buffer" }
    )
    vim.keymap.set("n", "<leader>ls", builtin.lsp_document_symbols, { noremap = true, desc = "Symbols (document)" })
    vim.keymap.set(
      "n",
      "<leader>lw",
      builtin.lsp_dynamic_workspace_symbols,
      { noremap = true, desc = "Symbold (workspace)" }
    )
    vim.keymap.set("n", "<leader>tb", ":Telescope buffers<CR>", { noremap = true, desc = "Buffers" })
    vim.keymap.set("n", "<leader><leader>", ":Telescope cmdline<CR>", { noremap = true, desc = "Execute command" })
  end,
}
