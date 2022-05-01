-- This file can be loaded by calling `lua require('plugins')` from your init.vim
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'tpope/vim-repeat'
    use 'tpope/vim-surround'
    use 'tpope/vim-unimpaired'
    use 'wellle/targets.vim'
    use {'mg979/vim-visual-multi', branch = 'master'}
    use 'phaazon/hop.nvim'
    use 'editorconfig/editorconfig-vim'
    use 'psliwka/vim-smoothie'
    use 'jiangmiao/auto-pairs'
    use 'ntpeters/vim-better-whitespace'

    -- Treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- Telescope
    use 'nvim-lua/plenary.nvim'
    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- git stuff
    use 'airblade/vim-gitgutter'
    use 'tpope/vim-fugitive'

    -- LSP stuff
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'

    -- Auto completion stuff
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'

    -- luasnip required for nvim-cmp
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- comment out code
    use 'numToStr/Comment.nvim'

    -- show the tags of the current file
    use 'majutsushi/tagbar'

    -- support for python poetry venv
    -- use 'petobens/poet-v'

    -- visually show undo tree
    use 'mbbill/undotree'

    -- Themes
    use {'folke/tokyonight.nvim', branch = 'main' }
    use 'nvim-lualine/lualine.nvim'
    -- show color preview for hex/rgb values
    use {'rrethy/vim-hexokinase', run = 'make hexokinase' }
    -- devicons always load this last
    use 'kyazdani42/nvim-web-devicons'
end)
