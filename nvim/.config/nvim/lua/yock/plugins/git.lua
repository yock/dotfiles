return {
  'kdheepak/lazygit.nvim',
  lazy = true,
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { '<Leader>g', '<cmd>LazyGit<cr>', { desc = 'Lazygit' } },
  },
}
