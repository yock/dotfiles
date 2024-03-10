local telescope = require('telescope')
local builtin = require('telescope.builtin')

-- Borrowed from https://stackoverflow.com/a/76991432/513872
telescope.setup{
        defaults = {
                -- configure to use ripgrep
                vimgrep_arguments = {
                        "rg",
                        "--follow",        -- Follow symbolic links
                        "--hidden",        -- Search for hidden files
                        "--no-heading",    -- Don't group matches by each file
                        "--with-filename", -- Print the file path with the matched lines
                        "--line-number",   -- Show line numbers
                        "--column",        -- Show column numbers
                        "--smart-case",    -- Smart case search

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
                        hidden = true,
                        -- needed to exclude some files & dirs from general search
                        -- when not included or specified in .gitignore
                        find_command = {
                                "rg",
                                "--files",
                                "--hidden",
                                "--glob=!**/.git/*",
                                "--glob=!**/.idea/*",
                                "--glob=!**/.vscode/*",
                                "--glob=!**/build/*",
                                "--glob=!**/dist/*",
                                "--glob=!**/yarn.lock",
                                "--glob=!**/package-lock.json",
                        },
                },
        },
}

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
