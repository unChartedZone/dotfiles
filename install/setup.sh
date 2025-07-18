#!/bin/bash

# Purpose of this script is to set up important dotfiles in the correct
# locations

ln -s ~/.dotfiles/vim/vimrc.symlink ~/.vimrc # Create vimrc symlink in home directory
ln -s ~/.dotfiles/zsh/zshrc.symlink ~/.zshrc
ln -s ~/.dotfiles/tmux/tmux.conf.symlink ~/.tmux.conf



