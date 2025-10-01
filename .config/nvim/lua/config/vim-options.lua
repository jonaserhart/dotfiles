-- tabs and stops
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
-- vim.cmd("set fillchars+=vert:\\ ")
vim.cmd("nnoremap <SPACE> <Nop>")
vim.cmd("tnoremap <ESC><ESC> <C-\\><C-n>")
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
-- vim.cmd("set clipboard+=unnamedplus")
vim.cmd("imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'")

require("config.signs").setup_signs()
require("config.autocmds").setup_auto_cmds()

-- spellcheck
vim.opt.spell = true
vim.opt.spelllang = "en_us"

-- folding
vim.opt.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldenable = false
vim.api.nvim_command("autocmd BufReadPost,FileReadPost * normal zR")

-- general keybindings: navigation
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

vim.diagnostic.config({
	virtual_lines = { current_line = true },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰰱",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "󰋼",
			[vim.diagnostic.severity.HINT] = "󰛨",
		},
		linehl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
		},
		numhl = {
			[vim.diagnostic.severity.WARN] = "WarningMsg",
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
		},
	},
})

vim.keymap.set("n", "<leader>i", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
end)

vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.laststatus = 3
vim.opt.cmdheight = 0
vim.opt.fillchars = {
	vert = "│",
	fold = " ",
	eob = " ",
	diff = "╱",
	msgsep = "‾",
	foldopen = "▾",
	foldsep = "│",
	foldclose = "▸",
}

-- lsp
require("config.lsp-config").setup()

-- setup gui

if vim.g.neovide then
	require("config.gui").setup()
end

local environment = os.getenv("NVIMENV") or "private"
vim.notify("NVIMENV: " .. environment)
