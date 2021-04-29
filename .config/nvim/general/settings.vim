" line number
set number relativenumber

" recursive file searches
set path+=**

" use system clipboard
set clipboard+=unnamedplus

" enable true terminal colors
set termguicolors

set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
set copyindent      " copy indent from the previous line
set hidden          " allow switching from modified buffers
set ignorecase      " ignore case when searching
set smartcase       " case insensitive search until caps is used}}}
set scrolloff=10     " start scrolling when cursor is 8 lines away from bottom
set signcolumn=yes

autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2

