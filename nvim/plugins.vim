call plug#begin('~/.config/nvim/plugged')

" General Plugins
Plug 'tpope/vim-fugitive' " Git integration
"Plug 'ctrlpvim/ctrlp.vim' " File Fuzzy Navigation
Plug 'tpope/vim-commentary' " Commenting
Plug 'sbdchd/neoformat'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'goolord/alpha-nvim'
Plug 'raimondi/delimitmate'

" Status line
Plug 'nvim-lualine/lualine.nvim'
Plug 'feline-nvim/feline.nvim'
" Plug 'itchyny/lightline.vim'
" Plug 'mengelbrecht/lightline-bufferline'

" Colorschemes 
Plug 'scwood/vim-hybrid'
Plug 'gkeep/iceberg-dark'
Plug 'morhetz/gruvbox'
Plug 'ntk148v/vim-horizon'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'mvpopuk/inspired-github.vim'
Plug 'michaeldyrynda/carbon'

" Telescope Plugins
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


lua require'alpha'.setup(require'alpha.themes.dashboard'.opts)

lua require('telescope').setup{ defaults = { file_ignore_patterns = {"target", "node_modules"}}}


