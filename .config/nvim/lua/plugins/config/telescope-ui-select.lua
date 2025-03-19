return {
  "nvim-telescope/telescope-ui-select.nvim",
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
      },
    })
    telescope.load_extension("ui-select")
    telescope.load_extension("live_grep_args")
    telescope.load_extension("orgmode")
  end,
}

