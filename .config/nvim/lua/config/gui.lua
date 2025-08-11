local M = {}

function M.setup()
  vim.opt.linespace = 20
  vim.o.guifont = "JetBrains Mono:h15"

  -- system clipboard
  vim.keymap.set('n', '<D-v>', '"+P')         -- Paste normal mode
  vim.keymap.set('v', '<D-v>', '"+P')         -- Paste visual mode
  vim.keymap.set('c', '<D-v>', '<C-R>+')      -- Paste command mode
  vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode

  vim.g.neovide_text_gamma = 0.8
  vim.g.neovide_text_contrast = 0.5

  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 20
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 20
  vim.g.neovide_floating_corner_radius = 0.25
  vim.g.neovide_box_drawing_mode = "native"

  vim.g.neovide_input_macos_option_key_is_meta = "only_left"

  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.api.nvim_create_user_command("NewNeovide", function()
    local command = "open -n -a Neovide"
    local handle = io.popen(command)
    if handle then
      handle:close()
    else
      print("Failed to open Neovide")
    end
  end, {})
  vim.api.nvim_set_keymap("n", "<D-n>", ":NewNeovide<CR>", { noremap = true, silent = true })

  vim.api.nvim_create_user_command("NewWeztermHere", function()
    local command = "wezterm cli spawn --new-window --cwd '" .. vim.fn.getcwd() .. "'"
    local handle = io.popen(command)
    if handle then
      handle:close()
    else
      print("Failed to open WezTerm")
    end
  end, {})
  vim.api.nvim_set_keymap("n", "<D-t>", ":NewWeztermHere<CR>", { noremap = true, silent = true })

  vim.g.floaterm_borderchars = "        "
end

return M
