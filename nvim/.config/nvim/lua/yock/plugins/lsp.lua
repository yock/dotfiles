return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'saghen/blink.cmp',
  },
  config = function()
    local lspconfig = require('lspconfig')
    local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
    local capabilities = require('blink.cmp').get_lsp_capabilities(lsp_capabilities) 

    lspconfig.pylsp.setup({ capabilities = capabilities })
    lspconfig.ts_ls.setup({ capabilities = capabilities })
    lspconfig.ruby_lsp.setup({ capabilities = capabilities })
    lspconfig.angularls.setup({ capabilities = capabilities })
    lspconfig.ols.setup({
      capabilities = capabilities,
      init_options = {
        checker_args = "-strict-style"
      },
    })
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
              'out',
              's',
              'c',
              't',
            }
          }
        }
      }
    })
    lspconfig.gopls.setup({ capabilities = capabilities })
    lspconfig.rust_analyzer.setup({ capabilities = capabilities })
    lspconfig.sourcekit.setup({ capabilities = capabilities })
    lspconfig.sqlls.setup({ capabilities = capabilities })

    local function filteredQuickfix()
      vim.lsp.buf.code_action({
        context = { only = { 'quickfix' } },
        apply = true,
        filter = function(codeAction)
          return codeAction.isPreferred
        end
      })
    end

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        local opts = { remap = false }
        vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set('n', '<C-f>', filteredQuickfix, opts)
        vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
        vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set('n', '<leader>vrh', function() vim.lsp.buf.signature_help() end, opts)
      end,
    })
  end
}
