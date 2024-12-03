return {
  "natecraddock/workspaces.nvim",
  config = function()
    require("workspaces").setup({
      hooks = {
        open = { "Telescope git_worktree" },
      }
    })
  end
}
