return {
  "natecraddock/workspaces.nvim",
  config = function()
    local workspaces = require("workspaces")
    workspaces.setup({
      hooks = {
        open = function()
          vim.api.nvim_exec_autocmds("User", { pattern = "WorkspacesOpen" })
          vim.cmd("Telescope find_files")
        end,
      }
    })
    -- local org_files_path = require("config.utils").get_custom_config("orgfiles", "~/orgfiles/")
    --
    -- local list = workspaces.list()
    -- local contains_org_files = false
    -- local contains_nvim_dir = false
    -- for i, item in ipairs(list) do
    --   if string.find(item, "orgfiles") then
    --     contains_org_files = true
    --   end
    --   if string.find(item, "nvim") then
    --     contains_nvim_dir = true
    --   end
    -- end
    --
    -- if contains_org_files then
    --   workspaces.add(org_files_path, "orgfiles")
    -- end
    -- if contains_nvim_dir then
    --   workspaces.add("~/.config/nvim", "nvim")
    -- end
  end
}
