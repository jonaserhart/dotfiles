return {
  "natecraddock/workspaces.nvim",
  config = function()
    local workspaces = require("workspaces")
    workspaces.setup({
      ui = {
        telescope = {
          border = "none",
          borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
        },
      },
      hooks = {
        open = function()
          vim.api.nvim_exec_autocmds("User", { pattern = "WorkspacesOpen" })
          vim.cmd("Telescope find_files")
        end,
      },
    })

    require("telescope").load_extension("workspaces")
    vim.keymap.set("n", "<leader>tw", ":Telescope workspaces<CR>", { noremap = true, desc = "Workspaces" })
  end,
}
