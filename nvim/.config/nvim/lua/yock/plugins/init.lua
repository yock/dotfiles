return {
  'mbbill/undotree',
  'f-person/git-blame.nvim',
  'nvim-lua/plenary.nvim',
  'mfussenegger/nvim-dap',
  -- 'github/copilot.vim',
  { 'folke/todo-comments.nvim', dependencies = { 'nvim-lua/plenary.nvim' }, opts = {} },
  { 'L3MON4D3/LuaSnip', build = 'make install_jsregexp', opts = {} },
}
