return {
  'mfussenegger/nvim-dap',
  config = function() end,
  keys = {
    { '<leader>dtb', function() require('dap').toggle_breakpoint() end, { desc = 'Toggle Breakpoint' } },
    { '<leader>dc', function() require('dap').continue() end, { desc = 'Start or continue execution' } },
    { '<leader>dso', function() require('dap').step_over() end, { desc = 'Step over' } },
    { '<leader>dsi', function() require('dap').step_into() end, { desc = 'Step into' } },
  }
}
