return {
  'mogulla3/rspec.nvim',
  opts = {
    allowed_file_format = function(filename)
      return vim.endswith(filename, '_spec.rb')
    end,

    formatter = 'progress',
    focus_on_last_spec_result_window = true,
    open_quickfix_when_spec_failed = true,
    last_result_path = vim.fn.stdpath('data') .. '/rspec_last_result',
    last_failed_result_path = vim.fn.stdpath('data') .. '/rspec_last_failed_result',
    jump_command = 'edit',
    ignored_dirs_on_jump = {},
  },
  keys = {
    { '<leader>rn', '<cmd>RSpecNearest<cr>', desc = 'Run nearest spec' },
    { '<leader>rf', '<cmd>RSpecCurrentFile<cr>', desc = 'Run spec file' },
    { '<leader>rr', '<cmd>RSpecRerun<cr>', desc = 'Run last spec' },
    { '<leader>rF', '<cmd>RSpecOnlyFailures<cr>', desc = 'Run previously failed specs' },
    { '<leader>rR', '<cmd>RSpecShowLastResult<cr>', desc = 'Show last result' },
  },
}
