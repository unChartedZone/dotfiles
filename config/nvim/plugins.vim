set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

Plugin 'VundleVim/Vundle.vim'
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
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
Plugin 'chriskempson/base16-vim'
Plugin 'morhetz/gruvbox'
" Plugin 'Valloric/YouCompleteMe'
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


let g:airline#extensions#tabline#enabled = 1
