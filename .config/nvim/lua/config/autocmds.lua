local M = {}

function M.setup_auto_cmds()
  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    desc = "Override file and folder icons of nvim-tree",
    callback = function()
      -- Set folder and file icon colors
      vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = "#A9AFBC" })
      vim.api.nvim_set_hl(0, "NvimTreeFileIcon", { fg = "#A9AFBC" })
      vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = "#A9AFBC" })
      vim.api.nvim_set_hl(0, "NvimTreeRootFolder", { fg = "#A9AFBC" })
      vim.api.nvim_set_hl(0, "NvimTreeOpenedFile", { fg = "#A9AFBC", bold = true })
      vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = "#A9AFBC", bold = true })
      vim.api.nvim_set_hl(0, "NvimTreeOpenedHL", { fg = "#A9AFBC", bold = true })
      vim.api.nvim_set_hl(0, "NvimTreeNormal", { link = "EdgyNormal" })
      vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { link = "EdgyNormal" })

      vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#A9AFBC" })
      vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = "#A9AFBC" })
      vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { link = "EdgyNormal" })
      vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { bg = "#2D313C", fg = "#5c6370" })

      -- xxx guibg=#282c33
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
