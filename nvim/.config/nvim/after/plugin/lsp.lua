local lsp = require('lsp-zero')
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

mason.setup({})
mason_lspconfig.setup({
	ensure_installed = {
		'ruby_ls',
    'rubocop',
		'tsserver',
		'lua_ls',
	},
	handlers = {
		lsp.default_setup,
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

lsp.on_attach(function(_client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	lsp.default_keymaps(opts)

	vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
	vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set('n', '<leader>vrh', function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()
