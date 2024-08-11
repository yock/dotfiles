return {
  'hrsh7th/nvim-cmp',
  dependencies= {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-emoji',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',
    'PhilRunninger/cmp-rpncalc',
    'andersevenrud/cmp-tmux',
    'tamago324/cmp-zsh',
    'Dynge/gitmoji.nvim',
    'SergioRibera/cmp-dotenv',
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    require('luasnip.loaders.from_vscode').lazy_load()

    luasnip.filetype_extend('ruby', { 'rails' })

    cmp.setup({
      snippet = {
        expand = function(args)
          print('expand called')
          print(args.body)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-j>'] = cmp.mapping.scroll_docs(-4),
        ['<C-k>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp:ruby_lsp' },
        { name = 'nvim_lsp:gopls' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
        { name = 'dotenv' },
      })
    })
  end,
}
