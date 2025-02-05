local M = {}

function M.setup()
  local lspconfig = require("lspconfig")
  local capabilities = require('blink.cmp').get_lsp_capabilities()

  lspconfig.ts_ls.setup({
    capabilities = capabilities,
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
    },
    -- settings = {
    --   complete_function_calls = true,
    --   vtsls = {
    --     enableMoveToFileCodeAction = true,
    --     autoUseWorkspaceTsdk = true,
    --     experimental = {
    --       completion = {
    --         enableServerSideFuzzyMatch = true,
    --       },
    --     },
    --   },
    --   typescript = {
    --     updateImportsOnFileMove = { enabled = "always" },
    --     suggest = {
    --       completeFunctionCalls = true,
    --     },
    --     inlayHints = {
    --       enumMemberValues = { enabled = true },
    --       functionLikeReturnTypes = { enabled = true },
    --       parameterNames = { enabled = "literals" },
    --       parameterTypes = { enabled = true },
    --       propertyDeclarationTypes = { enabled = true },
    --       variableTypes = { enabled = false },
    --     },
    --   },
    -- },
    on_attach = function(client, bufnr)
      --   local function buf_set_keymap(mode, lhs, rhs, opts)
      --     opts = opts or {}
      --     opts.buffer = bufnr
      --     vim.keymap.set(mode, lhs, rhs, opts)
      --   end
      --   buf_set_keymap("n", "<leader>co", function()
      --     vim.lsp.buf.execute_command({
      --       command = "_typescript.organizeImports",
      --       arguments = { vim.api.nvim_buf_get_name(0) },
      --     })
      --   end, { desc = "Organize Imports" })
      --
      --   buf_set_keymap("n", "<leader>cM", function()
      --     vim.lsp.buf.execute_command({
      --       command = "_typescript.addMissingImports",
      --       arguments = { vim.api.nvim_buf_get_name(0) },
      --     })
      --   end, { desc = "Add missing imports" })
      --
      --   buf_set_keymap("n", "<leader>cu", function()
      --     vim.lsp.buf.execute_command({
      --       command = "_typescript.removeUnused",
      --       arguments = { vim.api.nvim_buf_get_name(0) },
      --     })
      --   end, { desc = "Remove unused imports" })
      --
      --   buf_set_keymap("n", "<leader>cD", function()
      --     vim.lsp.buf.execute_command({
      --       command = "_typescript.applyFixAll",
      --       arguments = { vim.api.nvim_buf_get_name(0) },
      --     })
      --   end, { desc = "Fix all diagnostics" })
      --
      --   buf_set_keymap("n", "<leader>cV", function()
      --     vim.lsp.buf.execute_command({ command = "typescript.selectTypeScriptVersion" })
      --   end, { desc = "Select TS workspace version" })
    end,
  })
end

return M
