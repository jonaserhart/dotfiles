return {
  "laytan/cloak.nvim",
  config = function()
    require('cloak').setup({
      enabled = true,
      cloak_character = '*',
      highlight_group = 'Comment',
      cloak_length = nil, -- Provide a number if you want to hide the true length of the value.
      -- Whether it should try every pattern to find the best fit or stop after the first.
      try_all_patterns = true,
      -- Set to true to cloak Telescope preview buffers. (Required feature not in 0.1.x)
      cloak_telescope = true,
      -- Re-enable cloak when a matched buffer leaves the window.
      cloak_on_leave = false,
      patterns = {
        {
          -- Match any file starting with '.env'.
          -- This can be a table to match multiple file patterns.
          file_pattern = 'secret-*.yaml',
          -- Match an equals sign and any character after it.
          -- This can also be a table of patterns to cloak,
          -- example: cloak_pattern = { ':.+', '-.+' } for yaml files.
          cloak_pattern = ': .+',
        },
        {
          file_pattern = '.env*',
          cloak_pattern = '=.+',
        },
      },
    })
  end
}
