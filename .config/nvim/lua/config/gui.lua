local M = {}

function M.setup()
  vim.opt.linespace = 30
  vim.o.guifont = "Monaspace Argon:h14"
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
end

return M
