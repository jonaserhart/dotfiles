return {
  "akinsho/toggleterm.nvim", 
  config = function()
    function set_nvimtree_when_open_term(terminal)
      local nvimtree = require("nvim-tree.api")
      local nvimtree_view = require("nvim-tree.view")
      if nvimtree_view.is_visible() and terminal.direction == "horizontal" then
        local nvimtree_width = vim.fn.winwidth(nvimtree_view.get_winnr())
        nvimtree.tree.toggle()
        nvimtree_view.View.width = nvimtree_width
        nvimtree.tree.toggle(false, true)
      end
    end

    require("toggleterm").setup({
      on_open = set_nvimtree_when_open_term,
      size = function(term)
        if term.direction == "horizontal" then
          return 18
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
    })
    vim.keymap.set("n", "<C-t>", ":ToggleTerm<CR>", {})
  end,
}
