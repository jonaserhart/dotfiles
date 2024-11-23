local M = {}

function M.setup()
  local null_ls = require("null-ls");

  null_ls.register({
      null_ls.builtins.formatting.prettier.with({
        -- LSP options (e.g. formatting options) are available as params.options
        command = "prettier", -- docker run -i --rm -v $(pwd):$(pwd) -w $(pwd) prettier $@
        -- TODO Failure notification if prettier fails to execute
        extra_args = function(params)
          -- from https://github.com/jose-elias-alvarez/null-ls.nvim/discussions/1389#discussioncomment-4905919
          if vim.fs.dirname(vim.fs.find({ '.prettierrc', '.prettierrc.js' }, { upward = false })[1]) then
            vim.notify("Found prettier config file. Using its parameters.", "debug")
            return params.options -- exit early if we have a .prettierrc config
          end

          local default_cli_options = {
            "--arrow-parens=" .. "avoid",
            "--no-bracket-spacing",
            "--bracket-same-line=" .. "false",
            "--embedded-language-formatting=" .. "auto",
            "--end-of-line=" .. "lf",
            "--html-whitespace-sensitivity=" .. "strict",
            "--insert-pragma=" .. "false",
            "--require-pragma=" .. "false",
            --"--jsx-bracket-same-line = false,
            "--jsx-single-quote=" .. "false", -- I do not like single quotes!
            "--single-quote=" .. "false",
            "--use-tabs=" .. "false",
            "--print-width=" .. "80",
            "--prose-wrap=" .. "preserve",
            "--quote-props=" .. "consistent",
            "--semi=" .. "true",
            "--single-attribute-per-line=" .. "false",
            "--tab-width=" .. "2",
            "--trailing-comma=" .. "all",
          }
          vim.notify("Using prettier defaults: " .. table.concat(default_cli_options, ","), "debug")
          return default_cli_options -- your extra args serving as defaults if no .prettierrc
        end,
      })
  })
end

return M
