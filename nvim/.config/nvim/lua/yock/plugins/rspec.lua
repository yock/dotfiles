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
  }
}
