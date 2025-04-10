local get_eslint_client = function()
  local active_clients = vim.lsp.get_clients()
  for _, client in ipairs(active_clients) do
    if client.name == 'eslint' then
      return client
    end
  end
  return nil
end

local function eslint_fix_all(opts)
  opts = opts or {}

  local eslint_lsp_client = get_eslint_client()
  if eslint_lsp_client == nil then
    return
  end

  local request
  if opts.sync or false then
    request = function(bufnr, method, params)
      eslint_lsp_client.request(method, params, nil, bufnr)
    end
  else
    request = function(bufnr, method, params)
      eslint_lsp_client.request_sync(method, params, nil, bufnr)
    end
  end

  local bufnr = util.validate_bufnr(opts.bufnr or 0)
  request(0, 'workspace/executeCommand', {
    command = 'eslint.applyAllFixes',
    arguments = {
      {
        uri = vim.uri_from_bufnr(bufnr),
        version = lsp.util.buf_versions[bufnr],
      },
    },
  })
end
return {
  cmd = { "vscode-eslint-language-server", "--stdio" },
  filetypes = {
    'javascript',
    'javascriptreact',
    'javascript.jsx',
    'typescript',
    'typescriptreact',
    'typescript.tsx',
  },
  root_markers = {
    '.eslintrc.json', '.eslintrc.js', 'package.json', 'tsconfig.json',
  },
  settings = {
    validate = 'off',
    packageManager = 'npm',
    useESLintClass = false,
    codeActionOnSave = {
      enable = false,
      mode = 'all',
    },
    format = false,
    quiet = false,
    onIgnoredFiles = 'off',
    rulesCustomizations = {},
    run = 'onType',
    nodePath = vim.NIL,
    codeAction = {
      disableRuleComment = {
        enable = true,
        location = 'separateLine',
      },
      showDocumentation = {
        enable = true,
      },
    },
  },
  -- handlers = {
  --   ['eslint/openDoc'] = function(_, result)
  --     if not result then
  --       return
  --     end
  --     vim.cmd('!open ' .. result.url)
  --     return {}
  --   end,
  --   ['eslint/confirmESLintExecution'] = function(_, result)
  --     if not result then
  --       return
  --     end
  --     return 4 -- approved
  --   end,
  -- },
}
