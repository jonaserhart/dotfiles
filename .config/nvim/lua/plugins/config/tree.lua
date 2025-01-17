return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      renderer = {
        indent_markers = {
          enable = true,
          inline_arrows = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = " ",
          },
        },
        icons = {
          web_devicons = {
            file = {
              enable = true,
            },
          },
          git_placement = "before",
          modified_placement = "after",
          hidden_placement = "after",
          diagnostics_placement = "signcolumn",
          padding = " ",
          symlink_arrow = " ➛ ",
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
            modified = true,
            hidden = false,
            diagnostics = true,
            bookmarks = true,
          },
          glyphs = {
            default = " ",
            symlink = " ",
            bookmark = "󰆤 ",
            modified = "● ",
            hidden = "󰜌 ",
            folder = {
              default = " ",
              open = "󰝰 ",
              empty = " ",
              empty_open = " ",
              arrow_closed = "",
              arrow_open = "",
              symlink = " ",
              symlink_open = " ",
            },
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = false,
        debounce_delay = 500,
        severity = {
          min = vim.diagnostic.severity.HINT,
          max = vim.diagnostic.severity.ERROR,
        },
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
    })
    vim.keymap.set("n", "<C-n>", ":NvimTreeFocus<CR>", {})
    vim.keymap.set("n", "<C-C>", ":NvimTreeClose<CR>", {})
  end,
}
-- return {
--   "nvim-neo-tree/neo-tree.nvim",
--   branch = "v3.x",
--   dependencies = {
--     "nvim-lua/plenary.nvim",
--     "nvim-tree/nvim-web-devicons",
--     "MunifTanjim/nui.nvim",
--   },
--   config = function()
--     require("neo-tree").setup({
--       filesystem = {
--         hide_root_node = true,
--         filtered_items = {
--           hide_dotfiles = false,
--           hide_gitignored = false,
--           hide_by_name = {
--             "node_modules",
--             ".git",
--           },
--         },
--       },
--       default_component_configs = {
--         icon = {
--           folder_closed = " ",
--           folder_open = "󰝰 ",
--           folder_empty = " ",
--           -- provider = function(icon, node) -- default icon provider utilizes nvim-web-devicons if available
--           --   if node.type == "file" or node.type == "terminal" then
--           --     local success, web_devicons = pcall(require, "nvim-web-devicons")
--           --     local name = node.type == "terminal" and "terminal" or node.name
--           --     if success then
--           --       local devicon, hl = web_devicons.get_icon(name)
--           --       icon.text = devicon or icon.text
--           --       icon.highlight = hl or icon.highlight
--           --     end
--           --   end
--           -- end,
--           -- -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
--           -- -- then these will never be used.
--           -- default = "*",
--           -- highlight = "NeoTreeFileIcon",
--         },
--       },
--     })
--     vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
--     vim.keymap.set("n", "<leader>vc", ":Neotree git_status reveal left<CR>", {})
--     vim.keymap.set("n", "<C-C>", ":Neotree filesystem close<CR>", {})
--     --
--   end,
-- }
