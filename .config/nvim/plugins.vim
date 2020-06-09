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

    " Themes
    Plug 'morhetz/gruvbox'
    Plug 'christianchiarulli/onedark.vim'

    " fuzzy finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " status bar
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

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

    Plug 'chrisbra/Colorizer'

" Initialize plugin system
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
