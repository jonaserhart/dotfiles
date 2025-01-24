return {
  "natecraddock/workspaces.nvim",
  config = function()
    require("workspaces").setup({
      hooks = {
        open = function ()

          vim.api.nvim_exec_autocmds("User", { pattern = "WorkspacesOpen" })
          vim.cmd("Telescope find_files")
        end,
      }
    })
    local org_files_path = require("config.utils").get_custom_config("orgfiles", "~/orgfiles/")
    vim.cmd("WorkspacesAdd orgfiles " .. org_files_path .. " orgfiles")
    vim.cmd("WorkspacesAdd nvim ~/.config/nvim/")
  end
}
