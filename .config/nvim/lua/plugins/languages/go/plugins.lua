return {
  -- {
  --   "ray-x/go.nvim",
  --   dependencies = { -- optional packages
  --     "ray-x/guihua.lua",
  --     "neovim/nvim-lspconfig",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   config = function()
  --     require("go").setup({
  --       lsp_cfg = true,
  --       lsp_keymaps = false,
  --       diagnostic = {},
  --       lsp_inlay_hints = {
  --         enable = false,
  --       },
  --       icons = false,
  --       trouble = true,
  --     })
  --
  --     vim.keymap.set({ "n", "v" }, "<leader>ca", require("go.codeaction").run_code_action, {})
  --   end,
  --   event = { "CmdlineEnter" },
  --   ft = { "go", 'gomod' },
  --   build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  -- },
  {
    "leoluz/nvim-dap-go",
  },
  {
    "hexdigest/gounit-vim"
  }
}
