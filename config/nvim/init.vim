source ~/.dotfiles/config/nvim/plugins.vim
source ~/.dotfiles/config/nvim/colorscheme.vim
source ~/.dotfiles/config/nvim/keybindings.vim
source ~/.dotfiles/config/nvim/ctrlpSettings.vim

set relativenumber
set tabstop=4 shiftwidth=4 number autoindent noexpandtab wrap linebreak nolist 
set backspace=2
set autochdir
set mouse=a
set laststatus=2
set clipboard=unnamed "Lets vim and clipboard play nice togehter

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.DS_Store    " MacOSX/Linux
let g:deoplete#enable_at_startup = 1

set encoding=utf-8
set termguicolors
set cursorline!
set lazyredraw
set synmaxcol=128
syntax sync minlines=256
let g:python_host_prog = '/usr/local/bin/python'
" let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_at_startup = 1
" call deoplete#enable()

let g:airline_powerline_fonts = 1
"let g:airline_theme='wombat'
let g:airline_theme='tomorrow'
" let g:airline_section_c = '%t,%m'
let g:airline_section_warning = ''

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
