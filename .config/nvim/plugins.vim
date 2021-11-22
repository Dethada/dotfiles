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
    Plug 'wellle/targets.vim'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'phaazon/hop.nvim'
    Plug 'ggandor/lightspeed.nvim'

    " Themes
    " Plug 'joshdick/onedark.vim'
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

    " Telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " status bar
    Plug 'nvim-lualine/lualine.nvim'

    " git stuff
    Plug 'airblade/vim-gitgutter'

    " auto complete and definitions
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " comment out code
    Plug 'preservim/nerdcommenter'

    " show the tags of the current file
    Plug 'majutsushi/tagbar'

    " programming language pack
    Plug 'sheerun/vim-polyglot'
    " support for python poetry venv
    " Plug 'petobens/poet-v'

	" show color preview for hex/rgb values
	Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

	" visually show undo tree
	Plug 'mbbill/undotree'

    " devicons always load this last
    " Plug 'ryanoasis/vim-devicons'
    Plug 'kyazdani42/nvim-web-devicons'

" Initialize plugin system
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
