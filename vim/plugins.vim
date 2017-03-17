set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"####### General Plugins ############################################
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-commentary'
Plugin 'jiangmiao/auto-pairs'
Plugin 'rstacruz/sparkup'
Plugin 'tpope/vim-surround'
Plugin 'christoomey/vim-tmux-navigator'
"####### End of General Plugins ############################################

"####### Autocomplete Plugins #######################################
Plugin 'Shougo/neocomplete'
Plugin 'ternjs/tern_for_vim'
Plugin 'davidhalter/jedi-vim'
"####### End of Autocomplete Plugins ################################

"####### File Navigation Plugins ####################################
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ctrlpvim/ctrlp.vim'
"####### End of File Navigation Plugins #############################

"####### Status Bar Plugins #########################################
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"####### End of Status Bar Plugins ##################################

"####### Syntax Plugins ###########################
" Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'othree/yajs.vim'
Plugin 'hdima/python-syntax'
"####### Syntax Plugins ####################

"####### Color Schemes ###########################
Plugin 'chriskempson/base16-vim'
Plugin 'joshdick/onedark.vim'
Plugin 'morhetz/gruvbox'
Plugin 'juanedi/predawn.vim'
Plugin 'albertorestifo/github.vim'
Plugin 'marciomazza/vim-brogrammer-theme'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'whatyouhide/vim-gotham'
Plugin 'ryanoasis/vim-devicons'
Plugin 'arcticicestudio/nord-vim'
Plugin 'scwood/vim-hybrid'
"####### End of Color Schemes ####################

"####### Unused Plugins #############################################
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'justmao945/vim-clang'
"Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
"Plugin 'powerline/fonts'
"Plugin 'keith/swift.vim'
"Plugin 'majutsushi/tagbar'
"Plugin 'artur-shaik/vim-javacomplete2'
"Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'
" Plugin 'nathanaelkane/vim-indent-guides'
"####### End of Unused Plugins #######################################

call vundle#end()            " required
filetype plugin indent on    " required

"####### PLUGIN SETTINGS #############################################

"NerdTree Settings
let g:NERDTreeWinSize=21

"Ctrlp Settings
let g:ctrlp_show_hidden = 1
let g:ctrlp_formatline_func = 's:formatline(s:curtype() == "buf" ? v:val : WebDevIconsGetFileTypeSymbol(v:val) . " " . v:val) '

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|idea)|cmake-build-debug$',
  \ 'file': '\v\.(DS_STORE|idea|o|exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"Vim Airline Settings
let g:airline_powerline_fonts = 1
"let g:airline_theme='wombat'
let g:airline_theme='tomorrow'
" let g:airline_theme='github'
" let g:airline_theme='onedark'
" let g:airline_theme='base16_tomorrow'
" let g:airline_theme='gruvbox'
" let g:airline_theme='one'
" let g:airline_theme='base16_eighties'
" let g:airline_section_c = '%t,%m'
let g:airline_section_warning = ''
"Enable the tab bar styling
let g:airline#extensions#tabline#enabled = 1
" let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol='x'

let g:Powerline_symbols = 'fancy'
set encoding=utf-8
" set term=xterm-256color
set fillchars+=stl:\ ,stlnc:\

"Autocomplete Plugins Settings
let g:neocomplete#enable_at_startup = 1
let g:tern_show_argument_hints='on_hold'
let g:tern_map_keys=1
"Disables the preview window
set completeopt-=preview
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS


"Vim-clang settings
" let g:clang_cpp_completeopt = 'longest,menuone'
" let g:clang_auto = 1

" Javascript Library Settings
let g:used_javascript_libs = 'jquery'

"Synstatic Recommended settings
" set statusline+=%#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :lopen<CR>

"Devicons Settings
set guifont=FuraCode\ Nerd\ Font:h12
