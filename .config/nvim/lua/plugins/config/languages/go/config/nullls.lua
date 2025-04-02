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
              local output = vim.api.nvim_command_output(":GoUnit")
              vim.notify(output)
            end,
          },
        }
      end,
    },
  })

  local function get_current_package_name()
    local first_line = vim.api.nvim_buf_get_lines(0,0,1,false)[1]
    local package_name = first_line:match("^package%s+(%w+)")
    return package_name
  end

  local gomvp_code_action = h.make_builtin({
    name = "gomvp",
    method = methods.internal.CODE_ACTION,
    filetypes = { "go" },
    generator = {
      fn = function (context)
        local current_line = vim.api.nvim_get_current_line()

        if not current_line:match("^package*") then
          return 
        end

        return {{
          title = "Move package with gomvp",
          action = function ()
            local current_file = vim.fn.expand("%:p")
            local current_dir = vim.fn.fnamemodify(current_file, ":h")

            vim.ui.input({
              prompt = "Move package to directory: ",
              default = current_dir,
              completion = "dir",
            }, function (new_dir)
              if not new_dir or new_dir == "" then
                return 
              end

              local cmd = string.format("gomvp %s %s", current_dir, new_dir)

              local output = vim.fn.system(cmd)
              local exit_code = vim.v.shell_error

              if exit_code == 0 then
                vim.notify("Package moved successfully", vim.log.levels.INFO)

                vim.cmd("checktime")
              else
                vim.notify("Failed to move package: " .. output, vim.log.levels.ERROR)
              end
            end)
          end
        }}
      end
    }
  })

  -- null_ls.register({
  --   -- null_ls.builtins.code_actions.gomodifytags,
  --   -- null_ls.builtins.code_actions.impl,
  --   -- null_ls.builtins.diagnostics.golangci_lint,
  --   -- null_ls.builtins.formatting.goimports
  -- })
end

return M
