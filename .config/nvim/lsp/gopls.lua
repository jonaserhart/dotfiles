return {
  cmd = { "gopls" },
  filetypes = { "go", "gomod" },
  root_markers = {
    "go.mod",
    "main.go"
  },
  settings = {
    gopls = {
      experimentalPostfixCompletions = true,
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      staticcheck = true,
      gofumpt = true,
      vulncheck = "Imports",
      usePlaceholders = true,
    },
  }
}
