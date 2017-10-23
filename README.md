# My Dotfiles
These are the config files for zsh,tmux, hyperterm, intellij, clion, ctags, and everything
else I need to be productive on my computer. I work concurrently at the moment on a Macbook Pro so I'm not sure how compatible my settings would be in a Linux environment.

## Homebrew
Since I work mainly on macOS, I use homebrew as my package manager.
To install run the command `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"` in the terminal and you're all good to go! I have installed packages such as neovim, macvim, python 3 and many others.

## Zsh
I use zsh as my main shell. To set up, use the command `chsh -s /bin/zsh` to make zsh your default shell. If you would like to revert to your previous shell just run the previous command again but replace `/bin/zsh` with the shell of your choice. Then run the command `ln -s dotfiles/zsh/zshrc.symlink ~/.zshrc` to make a soft link.

## Vim & Neovim
I use both Vim and Neovim depending on my needs. Vim has plugins that make it a great light editor for almost any language, and Neovim on the other hand tweaked specifically for C/C++ and Javascript with the YouCompleteMe plugin.

## Emacs
I have slightly dabbled with emacs. It is not my main editor of choice. It is still a work in progress but I do plan on adding to it eventually.

## Screenshot of how it all looks
![alt text](images/pic1.png "Logo Title Text 1")
