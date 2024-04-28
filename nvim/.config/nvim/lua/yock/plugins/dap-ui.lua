return {
  'rcarriga/nvim-dap-ui',
  dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')
    dapui.setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,
  keys = {
    { '<leader>duo', function() require('dapui').open() end, { desc = 'Open DAP UI' } },
    { '<leader>duc', function() require('dapui').close() end, { desc = 'Close DAP UI' } },
    { '<leader>dut', function() require('dapui').toggle() end, { desc = 'Toggle DAP UI' } },
  },
}
