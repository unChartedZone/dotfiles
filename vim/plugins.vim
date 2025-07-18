call plug#begin('~/.vim/plugged')

" Core Plugins
Plug 'tpope/vim-fugitive'                              " Git integration
Plug 'ctrlpvim/ctrlp.vim'                              " File Fuzzy Navigation
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'mattn/emmet-vim'

" Language Plugins
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

" Themes
Plug 'gkeep/iceberg-dark'
Plug 'morhetz/gruvbox'
Plug 'ntk148v/vim-horizon'
Plug 'drewtempelmeyer/palenight.vim'

" Status Bar Plugins
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

call plug#end()

" CtrlP Settings
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()


