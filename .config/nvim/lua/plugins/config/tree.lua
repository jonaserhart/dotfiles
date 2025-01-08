return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            "node_modules",
            ".git",
          },
        },
        follow_current_file = {
          enabled = true,     -- This will find and focus the file in the active buffer every time
          --               -- the current file is changed while the tree is open.
          leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
      },
      window = {
        position = "left",
        width = 30,
        popup_border_style = "single",
        mapping_options = {
          noremap = true,
          nowait = true,
        },
      },
      renderer = {
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "",
              arrow_open = "",
              default = " ",
              open = " ",
              empty = " ",
              empty_open = " ",
              symlink = " ",
              symlink_open = " ",
            },
          },
        },
      },
    })
    vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
    vim.keymap.set("n", "<C-C>", ":Neotree filesystem close<CR>", {})
  end,
}
