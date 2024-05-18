return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'olimorris/neotest-rspec',
  },
  config = function()
    local neotest = require('neotest')
    local rspec = require('neotest-rspec')
    neotest.setup({
      adapters = {
        require('neotest-rspec'),
      },
    })

    rspec({
      rspec_cmd = function()
        return vim.tbl_flatten({
          'bin/rspec',
        })
      end
    })

    vim.keymap.set('n', '<leader>rn', function() require('neotest').run.run() end, { desc = 'Run nearest test' })
    vim.keymap.set('n', '<leader>rf', function() require('neotest').run.run(vim.fn.expand("%")) end, { desc = 'Run current file tests' })
    vim.keymap.set('n', '<leader>no', function() require('neotest').output.open({ enter = true, auto_close = true }) end, { desc = 'Open Neotest output window' })
  end,
}
