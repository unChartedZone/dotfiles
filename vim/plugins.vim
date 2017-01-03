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
"####### General Plugins ############################################

"####### Autocomplete Plugins #######################################
Plugin 'Shougo/neocomplete'
Plugin 'ternjs/tern_for_vim'
Plugin 'davidhalter/jedi-vim'
"####### End of Autocomplete Plugins ################################

"####### File Navigation Plugins ####################################
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
"####### End of File Navigation Plugins #############################

"####### Status Bar Plugins #########################################
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"####### End of Status Bar Plugins ##################################

"####### Syntax Plugins ###########################
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
"####### Syntax Plugins ####################

"####### Color Schemes ###########################
Plugin 'chriskempson/base16-vim'
Plugin 'joshdick/onedark.vim'
Plugin 'morhetz/gruvbox'
Plugin 'juanedi/predawn.vim'
"####### End of Color Schemes ####################

"####### Unused Plugins #############################################
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
"Plugin 'powerline/fonts'
"Plugin 'keith/swift.vim'
"Plugin 'majutsushi/tagbar'
"Plugin 'justmao945/vim-clang'
"Plugin 'artur-shaik/vim-javacomplete2'
"Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'
"####### End of Unused Plugins #######################################

call vundle#end()            " required
filetype plugin indent on    " required

"NerdTree Settings
let g:NERDTreeWinSize=21
