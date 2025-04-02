return {
  cmd = { "gopls" },
  fileypes = { "go", "gomod" },
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
      codelenses = {
        generate = true,
        gc_details = true,
        test = true,
        tidy = true,
        regenerate_cgo = true,
      },
      staticcheck = true,
      gofumpt = true,
      vulncheck = "Imports",
      usePlaceholders = true,
    },
  }
}
