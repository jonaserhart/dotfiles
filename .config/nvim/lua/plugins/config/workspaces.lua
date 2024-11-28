return {
  "natecraddock/workspaces.nvim",
  config = function()
    require("workspaces").setup({
      hooks = {
        open = { "Neotree filesystem reveal left", "Telescope find_files" },
      }
    })
  end
}
