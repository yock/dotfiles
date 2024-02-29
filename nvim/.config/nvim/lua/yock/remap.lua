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

