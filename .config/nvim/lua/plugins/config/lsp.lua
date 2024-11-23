return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp"
  },
  config = function()
    -- Set up language servers
    require("plugins.languages.go.config.lsp").setup();

    require("plugins.languages.lua.config.lsp").setup();

    require("plugins.languages.helm.config.lsp").setup();

    require("plugins.languages.typescript.config.lsp").setup();

    require("plugins.languages.bash.config.lsp").setup();

    require("plugins.languages.csharp.config.lsp").setup();

    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    vim.keymap.set({ "n", "v" }, "<leader>ca", function()
      require("tiny-code-action").code_action()
    end, { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>ne", vim.diagnostic.goto_next)
    vim.keymap.set("n", "<leader>pe", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
    vim.keymap.set("n", "<leader>gr", ":Telescope lsp_references<cr>", {})
    vim.keymap.set("n", "<leader>gi", ":Telescope lsp_implementations<cr>", {})
    vim.keymap.set("n", "<leader>gT", ":Telescope lsp_type_definitions<cr>", {})
  end,
}
