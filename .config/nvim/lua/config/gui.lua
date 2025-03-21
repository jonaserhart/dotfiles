local M = {}

function M.setup()
  vim.opt.linespace = 20
  vim.o.guifont = "Monaspace Neon Light:h14"
  vim.opt.fillchars = {
    horiz = " ",
    horizup = " ",
    horizdown = " ",
    vert = " ",
    vertleft = " ",
    vertright = " ",
    verthoriz = " ",
    eob = " ",
  }

  vim.g.neovide_text_gamma = 0.0
  vim.g.neovide_text_contrast = 0.5

  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 30
  vim.g.neovide_floating_corner_radius = 0.1

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

  vim.api.nvim_create_user_command("NewWezterm", function()
    local command = "open -n -a WezTerm"
    local handle = io.popen(command)
    if handle then
      handle:close()
    else
      print("Failed to open WezTerm")
    end
  end, {})
  vim.api.nvim_set_keymap("n", "<D-t>", ":NewWezterm<CR>", { noremap = true, silent = true })

  vim.g.floaterm_borderchars = "        "
end

return M
