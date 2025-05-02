return {
  cmd = { "helm_ls", "serve" },
  filetypes = { 'helm', 'yaml' },
  root_markers = {
    "Chart.yaml"
  },
  settings = {
    ['helm-ls'] = {
      yamlls = {
        showDiagnosticsDirectly = true,
        config = {
          validate = true,
          completion = true,
          format = {
            enable = true,
          },
          hover = true,
          schemas = {
            ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = {
              -- Pattern to match Argo Workflow files
              "templates/**/*workflow*.yaml",
              "templates/**/*workflow*.yml",
            }
          }
        }
      }
    }
  }

}
