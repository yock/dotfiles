require('rspec').setup({
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
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>rn", ":RSpecNearest<CR>", opts)
vim.keymap.set("n", "<leader>rcf", ":RSpecCurrentFile<CR>", opts)
vim.keymap.set("n", "<leader>rr", ":RSpecRerun<CR>", opts)
vim.keymap.set("n", "<leader>rof", ":RSpecOnlyFailures<CR>", opts)
vim.keymap.set("n", "<leader>rslr", ":RSpecShowLastResult<CR>", opts)
