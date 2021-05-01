" map leader to spacebar
let mapleader = " "

" trim white spaces
nmap <leader>t :call TrimWhitespace()<CR>

" move lines up and down with formatting
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Better indenting
vnoremap < <gv
vnoremap > >gv

" better pane navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" horizontal resize
noremap <silent> <C-S-Up> :resize +5<CR>
noremap <silent> <C-S-Down> :resize -5<CR>

" vertical resize
noremap <silent> <C-S-Left> :vertical resize +5<CR>
noremap <silent> <C-S-Right> :vertical resize -5<CR>

" undo highlight from search
nnoremap <silent> <F6> :let @/=""<CR>

" buffer cycling with tab
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>

" close buffer while keeping window open
" nnoremap <silent> <leader>q :lclose<bar>b#<bar>bd #<CR>
nnoremap <silent> <leader>q :bp\|bd #<CR>

" open list of open buffers
nnoremap <silent> <leader>b :Buffers<CR>
