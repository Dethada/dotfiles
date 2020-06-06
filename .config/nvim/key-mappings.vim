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

" undo highlight from search
nnoremap <silent> <F6> :let @/=""<CR>

" buffer cycling with tab
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>
