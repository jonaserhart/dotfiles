return {
  url = "https://gitlab.com/schrieveslaach/sonarlint.nvim",
  ft = { "go" },
  enabled = false,
  dependencies = {
    "williamboman/mason.nvim"
  },
  config = function()
    require('sonarlint').setup({
      server = {
        cmd = {
          'sonarlint-language-server',
          '-stdio',
          '-analyzers',
          vim.fn.expand("$MASON/share/sonarlint-analyzers/sonargo.jar"),
        },
        settings = {
          sonarlint = {
            rules = {
              ["go:S1314"] = { level = "on" },
              ["go:S131"] = { level = "on" },
              ["go:S134"] = { level = "on" },
              ["go:S138"] = { level = "on" },
              ["go:S1821"] = { level = "on" },
              ["go:S1067"] = { level = "on" },
              ["go:S122"] = { level = "on" },
              ["go:S104"] = { level = "on" },
            }
          }
        }
      },
      filetypes = {
        -- Tested and working
        'go',
      }
    })
  end
}
