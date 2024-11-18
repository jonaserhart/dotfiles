return {
  "RRethy/vim-illuminate", 
  config = function()
    vim.keymap.set('n', '<leader>nr', require('illuminate').goto_next_reference, {})
  end
}
