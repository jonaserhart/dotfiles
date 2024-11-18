return {
  "filipdutescu/renamer.nvim", 
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    local renamer = require("renamer")
    renamer.setup()

    vim.keymap.set('i', '<F2>', renamer.rename, { noremap = true, silent = true })
    vim.keymap.set('n', '<leader>rn', renamer.rename,
      { noremap = true, silent = true })
    vim.keymap.set('v', '<leader>rn', renamer.rename,
      { noremap = true, silent = true })
  end
}
