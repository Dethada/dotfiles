" gruvbox color scheme
set background=dark    " Setting dark mode

" Initialize colorscheme
" color scheme gruvbox
autocmd vimenter * colorscheme gruvbox

" set airline theme
let g:airline_theme = 'gruvbox'

" required for airline to work with gruvbox
autocmd vimenter * AirlineRefresh
