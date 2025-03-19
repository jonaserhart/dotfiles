return {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require("notify")
    notify.setup({
      background_colour = "#2C323E",
      render = "minimal",
    })
    vim.notify = notify
  end,
}
