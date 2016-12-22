let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
set t_Co=256
syntax enable
set background=dark
"let g:hybrid_custom_term_colors = 1
" colorscheme hybrid
" colorscheme hybrid_material
"colorscheme Tomorrow-Night
colorscheme onedark
" colorscheme base16-tomorrow-night
" colorscheme base16-eighties
" colorscheme  monokai
" colorscheme gruvbox

"This sets the color of the current line number
hi CursorLineNr   term=bold ctermfg=Yellow gui=bold guifg=Yellow
