return {
  "natecraddock/workspaces.nvim",
  config = function()
    require("workspaces").setup({
      hooks = {
        open = function ()

          vim.api.nvim_exec_autocmds("User", { pattern = "WorkspacesOpen" })
          vim.cmd("Telescope find_files")
        end
      }
    })
  end
}
