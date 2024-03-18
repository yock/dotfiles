return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Search all files' })
    vim.keymap.set('n', '<leader>pw', builtin.grep_string, { desc = 'Search the current word' })
    vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = 'Search with grep' })
    vim.keymap.set('n', '<leader>pf', builtin.help_tags, { desc = 'Search help' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Search buffers' })
    vim.keymap.set('n', '<leader>pr', builtin.resume, { desc = 'Resume search' })
    vim.keymap.set('n', '<leader>pd', builtin.diagnostics, { desc = 'Search diagnostics' })
    vim.keymap.set('n', '<leader>pb', builtin.builtin, { desc = 'Search Telescope builtins' })

    vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = 'Go to definition' })
    vim.keymap.set('n', 'gD', builtin.lsp_implementations, { desc = 'Go to implementation' })
    vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = 'Go to references' })
    vim.keymap.set('n', 'gt', builtin.lsp_type_definitions, { desc = 'Go to type definition' })
    vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, { desc = 'Search document symbols' })

    vim.keymap.set('n', '<leader>pnc', function()
      builtin.find_files({
        prompt_title = 'Neovim Configuration',
        cwd = vim.fn.stdpath('config'),
      })
    end, { desc = 'Search Neovim configuration' })

    telescope.setup({
      extensions = {
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = false, -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        },
      },
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--follow",        -- Follow symbolic links
          "--hidden",        -- Search for hidden files
          "--no-heading",    -- Don't group matches by each file
          "--with-filename", -- Print the file path with the matched lines
          "--line-number",   -- Show line numbers
          "--column",        -- Show column numbers
          "--smart-case",    -- Smart case search
          "--trim",          -- Trim whitespace from the start and end of each line

          -- Exclude some patterns from search
          "--glob=!**/.git/*",
          "--glob=!**/.idea/*",
          "--glob=!**/.vscode/*",
          "--glob=!**/build/*",
          "--glob=!**/dist/*",
          "--glob=!**/yarn.lock",
          "--glob=!**/package-lock.json",
        },
      },
      pickers = {
        find_files = {
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
      }
    })
    require('telescope').load_extension('fzf')
  end,
}
