return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    local lspconfig = require('lspconfig')
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    lspconfig.tsserver.setup({ capabilities = capabilities })
    lspconfig.ruby_lsp.setup({ capabilities = capabilities })
    lspconfig.angularls.setup({ capabilities = capabilities })
    lspconfig.emmet_ls.setup({
      capabilities = capabilities,
      filetypes = {
        'html',
        'eruby',
        'css',
        'scss',
        'sass',
        'javascript',
        'typescript',
        'javascriptreact',
        'typescriptreact'
      },
    })
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
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
    lspconfig.gopls.setup({ capabilities = capabilities })
    lspconfig.rust_analyzer.setup({ capabilities = capabilities })

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client.server_capabilities.inlayHintProvider then
          vim.lsp.inlay_hint.enable(ev.buf, true)
        end
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
