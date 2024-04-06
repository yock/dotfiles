return {
  'kkoomen/vim-doge',
  lazy = false,
  build = function()
    vim.api.nvim_command('call doge#install()')
  end,
  keys = {
    { '<leader>dg', '<Plug>(doge-generate)', desc = 'Generate docstring' },
  },
}
