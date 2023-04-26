so ~/.dotfiles/nvim/plugins.vim 
so ~/.dotfiles/nvim/keybindings.vim

lua require('init')

" General
set backspace=indent,eol,start      " Make backspace act normal
set splitbelow splitright           " Splits open below and to the right
set list listchars=tab:›\ ,trail:·  " Define how we show tabs and trailing spaces
set cursorline

" Indentation
set autoindent	                    " Auto-indent new lines
set expandtab                       " Use spaces instead of tabs
set shiftwidth=2                    " Number of auto-indent spaces
set smartindent                     " Enable smart-indent
set smarttab                        " Enable smart-tabs
set softtabstop=2                   " Number of spaces per Tab

" Search 
set hlsearch                        " Highlight all search results
set smartcase                       " Enable smart-case search
set ignorecase                      " Always case-insensitive
set incsearch                       " Searches for strings incrementally


" Colorscheme
set termguicolors
syntax enable
colorscheme gruvbox

" let g:lightline = {
"       \ 'colorscheme': 'palenight',
"       \ }


autocmd BufWritePre *.js Neoformat
autocmd BufWritePre *.json Neoformat


