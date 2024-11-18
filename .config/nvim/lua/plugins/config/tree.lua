return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 40,
      },
      renderer = {
        group_empty = true,
        root_folder_label = false,
      },
      filters = {
        dotfiles = false,
      },
      update_focused_file = {
        enable = true,
      },
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")

        api.config.mappings.default_on_attach(bufnr)
        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        vim.keymap.set("n", "s", api.node.open.edit, opts("Open"))
      end,
    })

    vim.keymap.set("n", "<C-n>", ":NvimTreeFocus<CR>", {})
    vim.keymap.set("n", "<C-C>", ":NvimTreeClose<CR>", {})
  end,
}
