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

-- DAP breakpoint symbols
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint", linehl = "DapBreakpointLine" })
vim.fn.sign_define("DapBreakpointCondition", { text = " ﳁ", texthl = "DapBreakpoint" })
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpoint" })
vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", numhl = "DapStopped", linehl = "DapStopped" })

-- folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.api.nvim_command("autocmd BufReadPost,FileReadPost * normal zR")

-- fix for DAP coloring
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

-- general keybindings: navigation
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

vim.diagnostic.config({
  virtual_text = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "󰰁",
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
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.laststatus = 3
vim.opt.cmdheight = 0
-- vim.opt.fillchars = {
--   horiz = "━",
--   horizup = "┻",
--   horizdown = "┳",
--   vert = "┃",
--   vertleft = "┫",
--   vertright = "┣",
--   verthoriz = "╋",
--   eob = " ",
-- }
