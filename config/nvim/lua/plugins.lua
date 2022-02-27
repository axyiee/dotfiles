--     ___           __
--    / _ \___ _____/ /_____ ____
--   / ___/ _ `/ __/  '_/ -_) __/
--  /_/   \_,_/\__/_/\_\\__/_/

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- APIs
  use 'RishabhRD/popfix'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-lua/popup.nvim'

  -- GitHub Copilot | [Setup] :Copilot init
  use 'github/copilot.vim'

  -- Customization: Color schemes
  use 'folke/tokyonight.nvim'
  use 'haishanh/night-owl.vim'
  use 'projekt0n/github-nvim-theme'
  use 'Mofiqul/vscode.nvim'
  use 'dracula/vim'
  use 'Shatur/neovim-ayu'
  use 'jdsimcoe/abstract.vim'
  use 'arzg/vim-colors-xcode'

  -- UI
  use 'kyazdani42/nvim-web-devicons'
  use 'romgrk/barbar.nvim'
  use 'nvim-lualine/lualine.nvim'
  use { 'lewis6991/gitsigns.nvim', config = function() require'gitsigns'.setup {} end }
  use 'karb94/neoscroll.nvim'
  use 'akinsho/toggleterm.nvim'
  use 'hood/popui.nvim'
  use 'stevearc/dressing.nvim'
  use 'rcarriga/nvim-notify'
  use 'gelguy/wilder.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/lsp-status.nvim'
  use 'folke/lsp-colors.nvim'
  use 'folke/trouble.nvim'
  use { "norcalli/nvim-colorizer.lua", config = function() require'colorizer'.setup {} end }
  use { 'j-hui/fidget.nvim', config = function() require'fidget'.setup {} end }
  use 'onsails/lspkind-nvim'

  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    config = function() require'nvim-tree'.setup { view = { side = "right", auto_resize = true } } end
  }

  -- Fuzzy finder support | [Deps] git-delta-git fzf bat
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-ui-select.nvim'
  use 'nvim-telescope/telescope-media-files.nvim'
  use 'gbrlsnchs/telescope-lsp-handlers.nvim'
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Editor
  use 'tpope/vim-surround'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'windwp/nvim-autopairs'
  use 'mattn/emmet-vim'
  use 'editorconfig/editorconfig-vim'
  use { 'Pocco81/AutoSave.nvim', config = function() require'autosave'.config {} end }

  -- Improved highlighting support | [Setup] :TSUpdate
  use 'nvim-treesitter/nvim-treesitter'

  -- Completion support
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'

  -- Start screen
  use 'startup-nvim/startup.nvim'

  -- Rust support
  use {
    'saecki/crates.nvim',
    tag = 'v0.1.0',
    config = function() require('crates').setup {} end,
  }
  use 'simrat39/rust-tools.nvim'

  -- Fennel support
  use 'Olical/conjure'
  use 'Olical/aniseed'

  -- Debugging
  use 'mfussenegger/nvim-dap'
  use 'rcarriga/nvim-dap-ui'
  use { 'michaelb/sniprun', config = function() require'sniprun'.setup {} end }
end)

