vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move highlights
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Paste over without copying what is under
vim.keymap.set('x', '<leader>p', "\"_dP")

-- Copy to system clipboard
vim.keymap.set('n', '<leader>y', "\"+y")
vim.keymap.set('v', '<leader>y', "\"+y")
vim.keymap.set('n', '<leader>Y', "\"+Y")

-- Split navigation
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')


vim.keymap.set('n', '<leader>pf', function() require('telescope.builtin').find_files() end)
vim.keymap.set('n', '<C-p>', require('telescope.builtin').git_files, {})
vim.keymap.set('n', '<leader>ps', function()
        require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- DAP
vim.keymap.set('n', '<leader>dtb', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<leader>dc', function() require('dap').continue() end)
vim.keymap.set('n', '<leader>dso', function() require('dap').step_over() end)
vim.keymap.set('n', '<leader>dsi', function() require('dap').step_into() end)
vim.keymap.set('n', '<leader>duo', function() require('dapui').open() end)
vim.keymap.set('n', '<leader>duc', function() require('dapui').close() end)
vim.keymap.set('n', '<leader>dut', function() require('dapui').toggle() end)

