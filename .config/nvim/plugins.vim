" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-unimpaired'
    Plug 'wellle/targets.vim'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    Plug 'phaazon/hop.nvim'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'psliwka/vim-smoothie'
    Plug 'jiangmiao/auto-pairs'

    " Treesitter
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " Telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " git stuff
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'

    " LSP stuff
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer'

    " Auto completion stuff
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-nvim-lua'

    " luasnip required for nvim-cmp
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'

    " comment out code
    Plug 'preservim/nerdcommenter'

    " show the tags of the current file
    Plug 'majutsushi/tagbar'

    " support for python poetry venv
    " Plug 'petobens/poet-v'

    " visually show undo tree
    Plug 'mbbill/undotree'

    " Themes
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    Plug 'nvim-lualine/lualine.nvim'
    " show color preview for hex/rgb values
    Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
    " devicons always load this last
    Plug 'kyazdani42/nvim-web-devicons'

" Initialize plugin system
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
