return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = { 'RRethy/nvim-treesitter-endwise' },
  build = ':TSUpdate',
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { 'lua', 'ruby', 'javascript', 'typescript', 'c', 'css', 'scss', 'go', 'rust' },
      sync_install = false,
      highlight = { enable = true },
      endwise = { enable = true },
      indent = { enable = true },
    })

    vim.cmd('autocmd FileType ruby setlocal indentkeys-=.')
    vim.opt.foldmethod = 'expr'
    vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
  end,
}
