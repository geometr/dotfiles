return require('packer').startup(function()
  use 'tpope/vim-fugitive'
  use 'neoclide/coc.nvim'
  use 'wakatime/vim-wakatime'
  use 'dense-analysis/ale'
  use 'folke/tokyonight.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use 'nvim-treesitter/nvim-treesitter'
  use 'lewis6991/gitsigns.nvim'
  use 'ms-jpq/coq_nvim'
  use 'folke/which-key.nvim'
end)

