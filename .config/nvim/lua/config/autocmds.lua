local M = {}

function M.setup_auto_cmds()
	vim.api.nvim_create_autocmd("ColorScheme", {
		pattern = "*",
		desc = "prevent colorscheme clears self-defined DAP icon colors.",
		callback = function()
			vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939" })
			vim.api.nvim_set_hl(0, "DapBreakpointLine", { ctermbg = 200, bg = "#453545" })
			vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef" })
			vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#f104f9" })

			-- transparent background
			if not vim.g.neovide then
				vim.cmd([[
  hi Normal guibg=NONE ctermbg=NONE
  hi NormalNC guibg=NONE ctermbg=NONE
  hi SignColumn guibg=NONE ctermbg=NONE
  hi StatusLine guibg=NONE ctermbg=NONE
  hi StatusLineNC guibg=NONE ctermbg=NONE
  hi VertSplit guibg=NONE ctermbg=NONE
  hi TabLine guibg=NONE ctermbg=NONE
  hi TabLineFill guibg=NONE ctermbg=NONE
  hi TabLineSel guibg=NONE ctermbg=NONE
  hi Pmenu guibg=NONE ctermbg=NONE
  hi PmenuSel guibg=NONE ctermbg=NONE
  hi NeoTreeNormal guibg=NONE ctermbg=NONE
  hi NeoTreeNormalNC guibg=NONE ctermbg=NONE
  hi NeoTreeWinSeparator guibg=NONE ctermbg=NONE
  hi NeoTreeEndOfBuffer guibg=NONE ctermbg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
  ]])
			end
		end,
	})

	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "go", "lua", "yaml", "bash", "helm", "json", "markdown", "rust", "python", "vim", "sh" },
		callback = function()
			vim.treesitter.start()
		end,
	})
end

return M
