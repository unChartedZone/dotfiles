
" ██╗   ██╗██╗███╗   ███╗
" ██║   ██║██║████╗ ████║
" ██║   ██║██║██╔████╔██║
" ╚██╗ ██╔╝██║██║╚██╔╝██║
"  ╚████╔╝ ██║██║ ╚═╝ ██║
"   ╚═══╝  ╚═╝╚═╝     ╚═╝

so ~/.dotfiles/vim/plugins.vim "Install plugins and set there settings
so ~/.dotfiles/vim/coldevicons.vim " Adds colored highlighting for devicons in nerdtree

"###########################################################################
"
"				GENERAL Settings
"
"###########################################################################

set relativenumber
set tabstop=4 shiftwidth=4 number autoindent noexpandtab nowrap linebreak nolist 
set backspace=2
set autochdir
set mouse=a "Lets the mouse to be used in vim
set laststatus=2 "Set up the status bar in vim
set clipboard=unnamed "Lets vim and clipboard play nice togehter
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.DS_Store    " MacOSX/Linux
set ttyfast "No idea what this does
set cursorline "Adds a highlight for the current line
set list lcs=tab:\|\ "This is for indent guides"
set splitright "This makes it so that splits are put on the right by default
set splitbelow 
set hlsearch "Highlight words when searching
set wildmenu

set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif


"###########################################################################
"
"				COLORSCHEME  PLUGINS
"
"###########################################################################

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
set t_Co=256
syntax enable
so ~/.dotfiles/vim/colorscheme.vim
if g:colors_name == 'hybrid'
	highlight LineNr guifg=#969896 
	highlight LineNr guibg=#282a2e
endif

"###########################################################################
"
"				KEYBINDINGS  PLUGINS
"
"###########################################################################

" set a map leader for more key combos
let mapleader = ' '
let g:mapleader = ' '

" Set scroll to be 3 times faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

"Sets neocomplete on and lets tab work for selecting suggestions
inoremap <expr><Tab>        pumvisible() ? "\<C-n>" : "\<Tab>"
"CtrlP Keybindings
nmap <C-n> :CtrlPTag<CR>
nmap <C-m> :CtrlPBufTagAll<CR>
nmap <C-b> :CtrlPBuffer<CR>
nmap <C-i> :!pdflatex %<CR>
" Cmd-r will send alt-d which opens ctrlp tags buffer
nmap ∂ :CtrlPBufTagAll<CR>
" Cmd-t will send alt-y which opens ctrlp
nmap ¥ :CtrlP<CR> 

"Nerdtree Keybinding(s)
nmap <C-t> :NERDTreeToggle<CR>
nmap ∫ :NERDTreeToggle<CR>

"Tagbar settings
nmap <F8> :TagbarToggle<CR>

"Shortcut command to stage whole repo while in vim
command A !git add .

"Remap escape key
inoremap <C-c> <esc>

" Lets me use shift enter to go to end of line, only works in iterm
inoremap ✠ <esc>A

"Save with command s
nmap ß :w<CR>

command OpenInBrowser !chrome %

nnoremap <Leader>a <C-a>

" vim:foldmethod=marker:foldlevel=0

" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

"Spellcheck
map <F6> :setlocal spell! spellang=en_us<CR>
