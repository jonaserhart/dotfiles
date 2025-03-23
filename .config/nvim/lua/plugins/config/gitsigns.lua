return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Actions
        map("n", "<leader>gsb", gs.toggle_current_line_blame)
        map("n", "<leader>gsh", ":Gitsigns select_hunk<CR>")
        map("v", "<leader>gss", ":Gitsigns stage_hunk<CR>")
        map("v", "<leader>gsu", ":Gitsigns undo_stage_hunk<CR>")
        map("n", "<leader>gsd", ":Gitsigns diffthis<CR>")
        map("v", "<leader>gsp", ":Gitsigns preview_hunk<CR>")
        map({ "n", "v" }, "<leader>gsn", ":Gitsigns next_hunk<CR>")
      end,
    })
  end,
}
