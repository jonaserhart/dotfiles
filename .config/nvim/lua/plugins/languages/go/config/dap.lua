local M = {}

function M.setup()
  local dapgo = require("dap-go")
  dapgo.setup({
    dap_configurations = {
      {
        type = "go",
        name = "Debug ginkgo spec",
        request = "launch",
        mode = "test",
        runner = "ginkgo",
        program = "${workspaceFolder}",
        args = {
          "ginkgo",
          "run",
          "${file}",
          "-v"
        }
      }
    }
  })
end

return M
