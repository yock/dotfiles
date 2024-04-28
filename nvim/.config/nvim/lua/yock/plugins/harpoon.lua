return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
  config = function()
    local harpoon = require('harpoon')

    harpoon:setup()

    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require('telescope.pickers').new({}, {
        prompt_title = 'Harpoon',
        finder = require('telescope.finders').new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({})
      }):find()

    end
    vim.keymap.set('n', '<Leader>hp', function() toggle_telescope(harpoon:list()) end, { desc = 'Open Harpoon window' })
    vim.keymap.set('n', '<Leader>ha', function() harpoon:list():add() end, { desc = 'Add buffer to Harpoon' })
    vim.keymap.set('n', '<Leader>hr', function() harpoon:list():remove() end, { desc = 'Add buffer to Harpoon' })
    vim.keymap.set('n', '<Leader>hc', function() harpoon:list():clear() end, { desc = 'Add buffer to Harpoon' })
    vim.keymap.set('n', '<C-S-P>', function() harpoon:list():prev() end, { desc = 'Choose previous Harpoon file' })
    vim.keymap.set('n', '<C-S-N>', function() harpoon:list():next() end, { desc = 'Choose next Harpoon file' })
  end,
}
