return {
  "mfussenegger/nvim-dap",
  dependencies = {
    {
      "rcarriga/nvim-dap-ui",
    },
    {
      "leoluz/nvim-dap-go",
    }
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")


    dapui.setup()

    vim.keymap.set('n', '<Leader>b', dap.toggle_breakpoint)
    vim.keymap.set('n', '<Leader>dc', dap.continue)
    vim.keymap.set('n', '<F5>', dap.continue)
    vim.keymap.set('n', '<F10>', dap.step_over)
    vim.keymap.set('n', '<F11>', dap.step_into)
    vim.keymap.set('n', '<leader>K', dapui.eval)

    local nvimtreeapi = require("nvim-tree.api")

    vim.keymap.set('n', '<leader><F5>', dap.terminate)

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
      nvimtreeapi.tree.close()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
      nvimtreeapi.tree.close()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
      nvimtreeapi.tree.open()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
      nvimtreeapi.tree.open()
    end
  end,

}
