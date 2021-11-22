nnoremap <C-g> :lua require('telescope.builtin').live_grep()<CR>
nnoremap <C-b> :lua require('telescope.builtin').buffers()<CR>
" nnoremap <C-p> :lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({}))<CR><CR>
nnoremap <C-p> :lua require('telescope.builtin').find_files()<CR>
nnoremap <C-f> :lua require('telescope.builtin').file_browser()<CR>

" nnoremap <leader>h :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>gf :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>gc :lua require('telescope.builtin').git_commits()<CR>
nnoremap <leader>gb :lua require('telescope.builtin').git_branches()<CR>
nnoremap <leader>gs :lua require('telescope.builtin').git_stash()<CR>
