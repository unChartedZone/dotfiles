"
" ███╗   ██╗██╗   ██╗██╗███╗   ███╗    ██████╗ ██╗     ██╗   ██╗ ██████╗ ██╗███╗   ██╗███████╗
" ████╗  ██║██║   ██║██║████╗ ████║    ██╔══██╗██║     ██║   ██║██╔════╝ ██║████╗  ██║██╔════╝
" ██╔██╗ ██║██║   ██║██║██╔████╔██║    ██████╔╝██║     ██║   ██║██║  ███╗██║██╔██╗ ██║███████╗
" ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║    ██╔═══╝ ██║     ██║   ██║██║   ██║██║██║╚██╗██║╚════██║
" ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║    ██║     ███████╗╚██████╔╝╚██████╔╝██║██║ ╚████║███████║
" ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝    ╚═╝     ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝╚═╝  ╚═══╝╚══════╝
"
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

"###########################################################################
"
"				GENERAL PLUGINS
"
"###########################################################################
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'rstacruz/sparkup'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'

"###########################################################################
"
"				AUTOCOMPLETE PLUGINS
"
"###########################################################################
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ternjs/tern_for_vim', {'for': 'javascript'}
Plug 'davidhalter/jedi-vim', {'for': 'python'}

"###########################################################################
"
"				FILE NAVIGATION PLUGINS
"
"###########################################################################
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'
"
"###########################################################################
"
"				STATUS BAR PLUGINS
"
"###########################################################################
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'

"###########################################################################
"
"				SYTNATX PLUGINS
"
"###########################################################################
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'posva/vim-vue'
" Plug 'pangloss/vim-javascript'

"###########################################################################
"
"				COLORSCHEME PLUGINS
"
"###########################################################################
" Plugin 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'colepeters/spacemacs-theme.vim'
Plug 'marciomazza/vim-brogrammer-theme'
Plug 'albertorestifo/github.vim'
Plug 'markvincze/panda-vim'
Plug 'ntk148v/vim-horizon'

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

call plug#end()            " required

"###########################################################################
"
"				PLUGIN SETTINGS
"
"###########################################################################

"NerdTree Settings
let NERDTreeIgnore = ['\.o$']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"Ctrlp Settings
let g:ctrlp_show_hidden = 1
let g:ctrlp_formatline_func = 's:formatline(s:curtype() == "buf" ? v:val : WebDevIconsGetFileTypeSymbol(v:val) . " " . v:val) '

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|idea|meteor)|cmake-build-debug|node_modules$',
  \ 'file': '\v\.(DS_STORE|idea|o|exe|so|dll)|.meta$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"Airline Settings
" let g:airline_theme='gruvbox'
" let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1
" let g:airline_section_c = '%t,%m'
" let g:airline_section_warning = ''

"Autocomplete Plugins Settings
let g:tern_show_argument_hints='on_hold'
let g:tern_map_keys=1
"Disables the preview window
set completeopt-=preview

"YouCompleteMe Settings
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
                                                                                            
