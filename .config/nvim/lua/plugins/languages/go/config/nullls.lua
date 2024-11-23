local M = {}

function M.setup()
  local null_ls = require("null-ls")
  local h = require("null-ls.helpers")
  local methods = require("null-ls.methods")

  local GOTEST_ACTION_TITLE = "Generate unit test"

  local function get_function_name()
    local ts_utils = require("nvim-treesitter.ts_utils")
    local node = ts_utils.get_node_at_cursor()

    while node do
      if node:type() == "function_declaration" or node:type() == "method_declaration" then
        for child in node:iter_children() do
          if child:type() == "identifier" or child:type() == "field_identifier" then
            return vim.treesitter.get_node_text(child, 0)
          end
        end
      end
      node = node:parent()
    end
    return nil
  end

  local gogeneratetest = h.make_builtin({
    name = "gotest_generator",
    method = methods.internal.CODE_ACTION,
    filetypes = { "go" },
    generator = {
      fn = function(context)
        local file = context.bufname
        if not file:match("%.go$") or file:match("_test%.go$") then
          return
        end

        local func_name = get_function_name()
        if not func_name then
          return
        end

        return {
          {
            title = GOTEST_ACTION_TITLE,
            action = function()
              vim.cmd(":GoUnit")
              vim.notify("Generated test for " .. func_name, vim.log.levels.INFO)
            end,
          },
        }
      end,
    },
  })
  local gotest = require("go.null_ls").gotest()
  local gotest_codeaction = require("go.null_ls").gotest_action()
  local golangci_lint = require("go.null_ls").golangci_lint()

  null_ls.register({
    gogeneratetest,
    null_ls.builtins.code_actions.gomodifytags,
    null_ls.builtins.code_actions.impl,
    gotest,
    gotest_codeaction,
    golangci_lint
  })
end

return M
