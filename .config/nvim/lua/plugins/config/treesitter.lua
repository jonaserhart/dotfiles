return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  branch = "main",
  build = ":TSUpdate",
  config = function()
    vim.api.nvim_create_autocmd('User', { pattern = 'TSUpdate',
    callback = function()
      require('nvim-treesitter.parsers').norg = {
        install_info = {
          url = 'https://github.com/nvim-neorg/tree-sitter-norg',
          generate = true,
          files = { "src/parser.c", "src/scanner.cc" },
          queries = 'queries/neovim', 
        },
      }
    end})
  end,
}
