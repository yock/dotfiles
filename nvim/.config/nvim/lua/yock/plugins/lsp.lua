return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'rafamadriz/friendly-snippets' },
  },
  config = function()
    require('mason').setup({})
    require('mason-lspconfig').setup({
      automatic_install = true,
      ensure_installed = {
        'solargraph',
        'ruby_ls',
        'rubocop',
        'lua_ls',
        'angularls',
        'tsserver',
      },
      handlers = {
        solargraph = function()
          require('lspconfig').solargraph.setup({
            cmd = { 'solargraph', 'stdio' },
            filetypes = { 'ruby' },
            root_dir = require('lspconfig.util').root_pattern('.git', '.solargraph.yml'),
          })
        end,
        tsserver = function()
          require('lspconfig').tsserver.setup({})
        end,
        rubocop = function()
          require('lspconfig').rubocop.setup({})
        end,
        ruby_ls = function()
          require('lspconfig').ruby_ls.setup({})
        end,
        angularls = function()
          require('lspconfig').angularls.setup({})
        end,
        lua_ls = function()
          require('lspconfig').lua_ls.setup({
            settings = {
              Lua = {
                diagnostics = {
                  globals = {
                    'vim',
                    'require',
                  }
                }
              }
            }
          })
        end,
      },
    })

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local opts = { remap = false }
        vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
        vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set('n', '<leader>vrh', function() vim.lsp.buf.signature_help() end, opts)
      end,
    })
  end
}
