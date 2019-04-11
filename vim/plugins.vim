" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

"###########################################################################
"
"				GENERAL PLUGINS
"
"###########################################################################
Plug 'tpope/vim-fugitive'			" Git integration  
Plug 'tpope/vim-dispatch'			"Takes advantage of Vim 8's asynchronous feature
Plug 'airblade/vim-gitgutter' 	" Show git changes on side gutter
Plug 'tpope/vim-commentary'		" Comment out lines easier
Plug 'jiangmiao/auto-pairs' 		" 
Plug 'rstacruz/sparkup' 			" Emmet-like plugin
Plug 'tpope/vim-surround' 		" Surround things with other things easier
Plug 'nathanaelkane/vim-indent-guides'

"###########################################################################
"
"				AUTOCOMPLETE PLUGINS
"
"###########################################################################
Plug 'Shougo/neocomplete'			"Provides autocompletion for html, css, and basic omnicomplete
Plug 'ternjs/tern_for_vim', {'for': 'javascript'}	"Provides smarter autocompletion for javascript
Plug 'davidhalter/jedi-vim', {'for': 'python'}		"Provides smarter autocompletion for python

"###########################################################################
"
"				FILE NAVIGATION PLUGINS
"
"###########################################################################
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } "Provides a tree view of all the files in the project
Plug 'Xuyuanp/nerdtree-git-plugin' "Displays git info inside nerdtree view
Plug 'ctrlpvim/ctrlp.vim' 		"Provides fuzzy find for files, tags, and functions in the project

"###########################################################################
"
"				STATUS BAR PLUGINS
"
"###########################################################################
Plug 'vim-airline/vim-airline' 			"Provides a nice statusline at the bottom of vim
Plug 'vim-airline/vim-airline-themes' 	"Provides different colorschemes for airline

"###########################################################################
"
"				SYTNATX PLUGINS
"
"###########################################################################
Plug 'pangloss/vim-javascript'
"Plugin 'othree/javascript-libraries-syntax.vim'
"Plugin 'othree/yajs.vim'
"Plugin 'hdima/python-syntax'

"###########################################################################
"
"				COLORSCHEME PLUGINS
"
"###########################################################################
Plug 'chriskempson/base16-vim'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'scwood/vim-hybrid'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'morhetz/gruvbox'
Plug 'juanedi/predawn.vim'
Plug 'albertorestifo/github.vim'
Plug 'marciomazza/vim-brogrammer-theme'
Plug 'whatyouhide/vim-gotham'
Plug 'arcticicestudio/nord-vim'
Plug 'colepeters/spacemacs-theme.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'cdmedia/itg_flat_vim'
Plug 'liuchengxu/space-vim-dark'
Plug 'ryanoasis/vim-devicons'

"###########################################################################
"
"				UNUSED PLUGINS
"
"###########################################################################
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

" Initialize plugin system
call plug#end()

"###########################################################################
"
"				PLUGIN SETTINGS
"
"###########################################################################

"NerdTree Settings
let NERDTreeIgnore = ['\.o$']

" GitGutter Settings 

"Ctrlp Settings
let g:ctrlp_show_hidden = 1
let g:ctrlp_formatline_func = 's:formatline(s:curtype() == "buf" ? v:val : WebDevIconsGetFileTypeSymbol(v:val) . " " . v:val) '

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|idea|meteor)|cmake-build-debug|node_modules$',
  \ 'file': '\v\.(DS_STORE|idea|o|exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"Vim Airline Settings
let g:airline_powerline_fonts = 1
let g:airline_section_warning = ''
let g:airline#extensions#tabline#enabled = 1 "Enable the tab bar styling

let g:Powerline_symbols = 'fancy'
set encoding=utf-8
" set term=xterm-256color
set fillchars+=stl:\ ,stlnc:\

"Autocomplete Plugins Settings
let g:neocomplete#enable_at_startup = 1
let g:tern_show_argument_hints='on_hold'
let g:tern_map_keys=1

set completeopt-=preview "Disables the preview window

let g:used_javascript_libs = 'jquery' " Javascript Library Settings

" Jedi Vim Settings
let g:jedi#show_call_signatures = "0"

set guifont=FuraCode\ Nerd\ Font:h12 "Devicons Settings
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
