local M = {}

function M.setup_auto_cmds()
  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    desc = "Override file and folder icons of nvim-tree",
    callback = function()
      -- Set folder and file icon colors
      vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#acb2be" })
      vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#acb2be" })
      vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = "#acb2be" })
      vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { link = "EdgyNormal" })
      vim.api.nvim_set_hl(0, "LspInlayHint", { link = "@comment" })
      vim.api.nvim_set_hl(0, "PmenuSel", { fg = "#bdd3ff", bg = "#3b3f52" })
    end,
  })

  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    desc = "prevent colorscheme clears self-defined DAP icon colors.",
    callback = function()
      vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939" })
      vim.api.nvim_set_hl(0, "DapBreakpointLine", { ctermbg = 200, bg = "#453545" })
      vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef" })
      vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379" })
    end,
  })
end

return M
