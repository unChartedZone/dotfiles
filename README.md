# My Dotfiles
These are the config files for zsh, tmux, hyperterm, intellij, clion, ctags, and
everything else I need to be productive on my computer. To set up, run the
command `git clone https://github.com/unChartedZone/dotfiles.git ~/.dotfiles`.
But be warned, that if you have a folder of that same name in your home
directory, it will be overwritten.

## Homebrew
I work mainly on macOS, thus I use homebrew as my package manager.
To install run the command `/usr/bin/ruby -e "$(curl -fsSL
https://raw.githubusercontent.com/Homebrew/install/master/install)"` in the
terminal and you're all good to go!

## Zsh
I use zsh as my main shell. To set up, use the command `chsh -s /bin/zsh`
to make zsh your default shell. Then run the command `ln -s
dotfiles/zsh/zshrc.symlink ~/.zshrc` to make a soft link.

## Tmux 
Tmux is a great tool if you like to have multiple terminal windows open at once
and get nothing accomplished. To try it out, use the command `ln -s
.dotfiles/tmux/tmux.conf.symlink ~/.tmux.conf ` I made the prefix key for tmux
Ctrl-A and changed my caps-lock key to be a second ctrl key, that way allowing
me to quickly enable the prefix motion.

## Vim & Neovim 
I use both Vim and Neovim depending on my needs. Vim for any
kind of language, and Neovim tweaked specifically for C/C++ and Javascript.

## Screenshot of how it all looks
![alt text](images/pic1.png "Logo Title Text 1")
