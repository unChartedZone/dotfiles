
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'	" Git integration  
Plug 'ctrlpvim/ctrlp.vim'	"Provides fuzzy find for files, tags, and functions in the project

" Themes
Plug 'morhetz/gruvbox'
Plug 'ntk148v/vim-horizon'
Plug 'Rigellute/shades-of-purple.vim'

" Language
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'maxmellon/vim-jsx-pretty'

" Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'vim-airline/vim-airline' 		"Provides a nice statusline at the bottom of vim
Plug 'vim-airline/vim-airline-themes' 	"Provides different colorschemes for airline

" Initialize plugin system
call plug#end()

" Ctrl+P Settings
let g:ctrl_show_hidden = 1

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|idea|meteor)|cmake-build-debug|node_modules$',
  \ }

let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<Tab>" :
  \ coc#refresh()


let g:vue_pre_processors = ['scss']

