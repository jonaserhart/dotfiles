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
        map("n", "<leader>gb", gs.toggle_current_line_blame)
        map("n", "<leader>sh", ":Gitsigns select_hunk<CR>")
        map("v", "<leader>Sh", ":Gitsigns stage_hunk<CR>")
      end,
    })
  end,
}
