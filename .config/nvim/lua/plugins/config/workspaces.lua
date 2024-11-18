return {
  "natecraddock/workspaces.nvim",
  config = function()
    require("workspaces").setup({
      hooks = {
        open = { "NvimTreeOpen", "Telescope find_files" },
      }
    })
  end
}
