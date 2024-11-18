return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp"
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require("lspconfig")

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
    })

    lspconfig.bashls.setup({
      capabilities = capabilities,
    })

    lspconfig.csharp_ls.setup({
      capabilities = capabilities,
    })

    lspconfig.gopls.setup({
      capabilities = capabilities,
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
          vulncheck = "imports",
          usePlaceholders = true,
        },
      },
    })

    lspconfig.helm_ls.setup({
      settings = {
        ["helm-ls"] = {
          yamlls = {
            path = "yaml-language-server",
          },
        },
      },
    })

    -- lspconfig.tsserver.setup({ enabled = false })
    lspconfig.ts_ls.setup({ enabled = false })

    lspconfig.vtsls.setup({
      filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
      },
      settings = {
        complete_function_calls = true,
        vtsls = {
          enableMoveToFileCodeAction = true,
          autoUseWorkspaceTsdk = true,
          experimental = {
            completion = {
              enableServerSideFuzzyMatch = true,
            },
          },
        },
        typescript = {
          updateImportsOnFileMove = { enabled = "always" },
          suggest = {
            completeFunctionCalls = true,
          },
          inlayHints = {
            enumMemberValues = { enabled = true },
            functionLikeReturnTypes = { enabled = true },
            parameterNames = { enabled = "literals" },
            parameterTypes = { enabled = true },
            propertyDeclarationTypes = { enabled = true },
            variableTypes = { enabled = false },
          },
        },
      },
      on_attach = function(client, bufnr)
        -- Key mappings
        local function buf_set_keymap(mode, lhs, rhs, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, lhs, rhs, opts)
        end
        buf_set_keymap("n", "<leader>co", function()
          vim.lsp.buf.execute_command({
            command = "_typescript.organizeImports",
            arguments = { vim.api.nvim_buf_get_name(0) },
          })
        end, { desc = "Organize Imports" })

        buf_set_keymap("n", "<leader>cM", function()
          vim.lsp.buf.execute_command({
            command = "_typescript.addMissingImports",
            arguments = { vim.api.nvim_buf_get_name(0) },
          })
        end, { desc = "Add missing imports" })

        buf_set_keymap("n", "<leader>cu", function()
          vim.lsp.buf.execute_command({
            command = "_typescript.removeUnused",
            arguments = { vim.api.nvim_buf_get_name(0) },
          })
        end, { desc = "Remove unused imports" })

        buf_set_keymap("n", "<leader>cD", function()
          vim.lsp.buf.execute_command({
            command = "_typescript.applyFixAll",
            arguments = { vim.api.nvim_buf_get_name(0) },
          })
        end, { desc = "Fix all diagnostics" })

        buf_set_keymap("n", "<leader>cV", function()
          vim.lsp.buf.execute_command({ command = "typescript.selectTypeScriptVersion" })
        end, { desc = "Select TS workspace version" })
      end,
    })

    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    -- vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    vim.keymap.set("n", "<leader>ca", function()
      require("tiny-code-action").code_action()
    end, { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>ne", vim.diagnostic.goto_next)
    vim.keymap.set("n", "<leader>pe", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
    vim.keymap.set("n", "<leader>gr", ":Telescope lsp_references<cr>", {})
    vim.keymap.set("n", "<leader>gi", ":Telescope lsp_implementations<cr>", {})
    vim.keymap.set("n", "<leader>gT", ":Telescope lsp_type_definitions<cr>", {})
  end,
}
