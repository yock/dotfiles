vim.opt.nu = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.nvim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'

vim.opt.colorcolumn = '120'

vim.wo.relativenumber = true

vim.g.mapleader = '\\'

vim.api.nvim_command('filetype plugin on')

vim.api.nvim_create_autocmd(
  { 'BufNewFile', 'BufRead' },
  {
    pattern = 'Guardfile',
    callback = function()
      vim.bo.filetype = 'ruby'
    end,
  }
)

vim.cmd.colorscheme('tempus_past')
