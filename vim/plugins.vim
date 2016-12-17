set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Shougo/neocomplete'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'ternjs/tern_for_vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'rstacruz/sparkup'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-commentary'
Plugin 'davidhalter/jedi-vim'
Plugin 'joshdick/onedark.vim'
"Plugin 'Valloric/YouCompleteMe'
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
