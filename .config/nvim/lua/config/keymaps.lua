local M = {}

function M.register_global_keymaps()
  -- register keymap to run: golangci-lint run --fix on the current file
  vim.api.nvim_set_keymap('n', '<leader>gf', ':!golangci-lint run --fix %<CR>', { noremap = true, silent = true })

end

return M


