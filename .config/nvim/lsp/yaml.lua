YamllsSettings = {
  schemas = {
    ["Argo Workflows"] = "/*",
  },
}

return {
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { 'yaml' },
  settings = {
    yaml = {
      validate = true,
      completion = true,
      hover = true,
      schemas = {
        ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = {
          -- Pattern to match Argo Workflow files
          "templates/*workflow*.yaml",
          "templates/*workflow*.yml",
          -- You can add more patterns if needed
        }
      }
    }
  }
}
