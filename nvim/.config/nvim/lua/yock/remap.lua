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
