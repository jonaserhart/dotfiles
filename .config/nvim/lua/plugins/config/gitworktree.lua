return {
  "ThePrimeagen/git-worktree.nvim",
  config = function()
    require("git-worktree").setup()
    local Worktree = require("git-worktree")


    Worktree.on_tree_change(function(op, metadata)
      if op == Worktree.Operations.Switch then
        print("Switched from " .. metadata.prev_path .. " to " .. metadata.path)
        vim.cmd("Neotree filesystem reveal left")
        vim.cmd("Telescope find_files")
      end
    end)

    require("telescope").load_extension("git_worktree")
  end
}
