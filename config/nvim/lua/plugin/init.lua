--    ___  __          _
--   / _ \/ /_ _____ _(_)__  ___
--  / ___/ / // / _ `/ / _ \(_-<
-- /_/  /_/\_,_/\_, /_/_//_/___/
--             /___/

local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- theming
    use 'olivercederborg/poimandres.nvim'

    -- api's
    use 'kyazdani42/nvim-web-devicons'
    use 'nvim-lua/plenary.nvim'
    use 'lewis6991/impatient.nvim'
    use 'nathom/filetype.nvim'
    use { 'j-hui/fidget.nvim', config = function() require 'fidget'.setup {} end }

    -- ui
    use { 'rcarriga/nvim-notify', config = function() require 'plugin.notify' end }
    use { 'goolord/alpha-nvim', config = function() require 'plugin.alpha' end }
    use { 'kyazdani42/nvim-tree.lua', config = function() require 'plugin.tree' end }
    use { 'romgrk/barbar.nvim', config = function() require 'plugin.barbar' end }
    use { 'NvChad/nvim-colorizer.lua', config = function() require 'colorizer' end }
    use { 'stevearc/dressing.nvim', config = function() require 'plugin.dressing' end }
    use { 'gelguy/wilder.nvim', config = function() require 'plugin.wilder' end }
    use 'nvim-lualine/lualine.nvim'
    use { 'folke/lsp-colors.nvim', config = function() require 'lsp-colors'.setup {} end }
    use 'nvim-lua/lsp-status.nvim'
    use { 'lewis6991/gitsigns.nvim', config = function() require 'gitsigns'.setup {} end }

    -- fuzzy finder
    use { 'nvim-telescope/telescope.nvim', config = function() require 'plugin.telescope' end }
    use 'nvim-telescope/telescope-ui-select.nvim'
    use 'nvim-telescope/telescope-media-files.nvim'
    use 'nvim-telescope/telescope-file-browser.nvim'
    use 'gbrlsnchs/telescope-lsp-handlers.nvim'
    use 'nvim-telescope/telescope-fzy-native.nvim'

    -- lsp
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'
    use 'onsails/lspkind.nvim'
    use { 'nvim-treesitter/nvim-treesitter', config = function() require 'plugin.treesitter' end, run = ':TSUpdate' }
    use { 'ray-x/lsp_signature.nvim', config = function() require 'plugin.signature' end }
    use 'neovim/nvim-lspconfig'
    use 'jose-elias-alvarez/null-ls.nvim'

    -- editor
    use 'fedepujol/move.nvim'
    use { 'numToStr/Comment.nvim', config = function() require 'Comment'.setup {} end }
    use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end }
    use { 'lukas-reineke/indent-blankline.nvim', config = function() require 'indent_blankline'.setup {} end }
    use {
        'bennypowers/nvim-regexplainer',
        config = function() require 'regexplainer'.setup {} end,
        requires = { 'MunifTanjim/nui.nvim' }
    }
    use 'windwp/nvim-ts-autotag'

    -- util
    use 'github/copilot.vim'
    use { 'andweeb/presence.nvim', config = function() require 'plugin.discord' end }

    -- rust
    use { 'saecki/crates.nvim', config = function() require 'crates'.setup {} end }

    -- lisp
    use 'elkowar/yuck.vim'

    if packer_bootstrap then
        require('packer').sync()
    end
end)
