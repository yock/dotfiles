vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = 'Ex mode' }) 

-- Move highlights
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv") 
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Paste over without copying what is under
vim.keymap.set('x', '<leader>p', "\"_dP")

-- Copy to system clipboard
vim.keymap.set('n', '<leader>y', "\"+y")
vim.keymap.set('v', '<leader>y', "\"+y")
vim.keymap.set('n', '<leader>Y', "\"+Y")

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Show diagnostic error messages' })
vim.keymap.set('n', '<leader>do', vim.diagnostic.open_float, { desc = 'Open diagnostic quickfix' })

-- Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- DAP
vim.keymap.set('n', '<leader>dtb', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<leader>dc', function() require('dap').continue() end)
vim.keymap.set('n', '<leader>dso', function() require('dap').step_over() end)
vim.keymap.set('n', '<leader>dsi', function() require('dap').step_into() end)
vim.keymap.set('n', '<leader>duo', function() require('dapui').open() end)
vim.keymap.set('n', '<leader>duc', function() require('dapui').close() end)
vim.keymap.set('n', '<leader>dut', function() require('dapui').toggle() end)

-- Cloak
vim.keymap.set('n', '<leader>ct', function() require('cloak').toggle() end, { desc = 'Toggle cloak' })
