local function bootstrap_pckr()
	local pckr_path = vim.fn.stdpath('data') .. 'pckr/pckr.nvim'

	if not vim.loop.fs_stat(pckr_path) then
		vim.fn.system({
			'git',
			'clone',
			'--filter=blob:none',
			'https://github.com/lewis6991/pckr.nvim',
			pckr_path
		})
	end

	vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require('pckr').add{
  { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } },
	'kepano/flexoki-neovim',
	{ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
	'mbbill/undotree',
	{
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'L3MON4D3/LuaSnip' },
			{ 'hrsh7th/cmp-path' },
			{ 'hrsh7th/cmp-nvim-lua' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'rafamadriz/friendly-snippets' },
			{ 'saadparwaiz1/cmp_luasnip' },
		},
	},
  'f-person/git-blame.nvim',
  'github/copilot.vim',
  'laytan/cloak.nvim',
  'kylechui/nvim-surround',
  'mogulla3/rspec.nvim',
}
