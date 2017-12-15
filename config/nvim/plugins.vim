set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

"###########################################################################
"
"				GENERAL PLUGINS
"
"###########################################################################
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-commentary'
Plugin 'jiangmiao/auto-pairs'
Plugin 'rstacruz/sparkup'
Plugin 'tpope/vim-surround'
Plugin 'ryanoasis/vim-devicons'

"###########################################################################
"
"				AUTOCOMPLETE PLUGINS
"
"###########################################################################
Plugin 'Valloric/YouCompleteMe'
Plugin 'ternjs/tern_for_vim'
Plugin 'davidhalter/jedi-vim'

"###########################################################################
"
"				FILE NAVIGATION PLUGINS
"
"###########################################################################
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
"
"###########################################################################
"
"				STATUS BAR PLUGINS
"
"###########################################################################
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"###########################################################################
"
"				SYTNATX PLUGINS
"
"###########################################################################
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'

"###########################################################################
"
"				COLORSCHEME PLUGINS
"
"###########################################################################
" Plugin 'joshdick/onedark.vim'
Plugin 'rakr/vim-one'
Plugin 'chriskempson/base16-vim'
Plugin 'morhetz/gruvbox'
Plugin 'colepeters/spacemacs-theme.vim'
Plugin 'marciomazza/vim-brogrammer-theme'
Plugin 'albertorestifo/github.vim'

"###########################################################################
"
"				UNUSED PLUGINS
"
"###########################################################################
" Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plugin 'KeitaNakamura/neodark.vim'
" Plugin 'Shougo/neocomplete'
"Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
"Plugin 'powerline/fonts'
"Plugin 'vim-syntastic/syntastic'
"Plugin 'keith/swift.vim'
"Plugin 'majutsushi/tagbar'
"Plugin 'justmao945/vim-clang'
"Plugin 'artur-shaik/vim-javacomplete2'
"Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'

call vundle#end()            " required
filetype plugin indent on    " required

"###########################################################################
"
"				PLUGIN SETTINGS
"
"###########################################################################

"NerdTree Settings
let NERDTreeIgnore = ['\.o$']

"Ctrlp Settings
let g:ctrlp_show_hidden = 1
let g:ctrlp_formatline_func = 's:formatline(s:curtype() == "buf" ? v:val : WebDevIconsGetFileTypeSymbol(v:val) . " " . v:val) '

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|idea|meteor)|cmake-build-debug|node_modules$',
  \ 'file': '\v\.(DS_STORE|idea|o|exe|so|dll)|vsh|.meta$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"Airline Settings
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
" let g:airline_section_c = '%t,%m'
let g:airline_section_warning = ''

"Autocomplete Plugins Settings
let g:tern_show_argument_hints='on_hold'
let g:tern_map_keys=1
"Disables the preview window
set completeopt-=preview

"YouCompleteMe Settings
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
