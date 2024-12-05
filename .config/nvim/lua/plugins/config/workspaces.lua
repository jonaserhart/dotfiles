return {
  "natecraddock/workspaces.nvim",
  config = function()
    require("workspaces").setup({
      hooks = {
        open = { "Telescope find_files " },
      }
    })
  end
}
