# My macOS 

```
      ██            ██     ████ ██  ██
     ░██           ░██    ░██░ ░░  ░██
     ░██  ██████  ██████ ██████ ██ ░██  █████   ██████
  ██████ ██░░░░██░░░██░ ░░░██░ ░██ ░██ ██░░░██ ██░░░░
 ██░░░██░██   ░██  ░██    ░██  ░██ ░██░███████░░█████
░██  ░██░██   ░██  ░██    ░██  ░██ ░██░██░░░░  ░░░░░██
░░██████░░██████   ░░██   ░██  ░██ ███░░██████ ██████
 ░░░░░░  ░░░░░░     ░░    ░░   ░░ ░░░  ░░░░░░ ░░░░░░

```
These are the config files for zsh,tmux, hyperterm, intellij, clion, ctags, and
everything else I need to be productive on my computer. These settings are
primarily tailored for a macOS setting, if you would like to see my linux
configurations, please switch over to the manjaro branch :)

## homebrew
Since this is on macOS, I use homebrew as my package manager.  To install
run the command `/usr/bin/ruby -e "$(curl -fsSL
https://raw.githubusercontent.com/Homebrew/install/master/install)"` in the
terminal and you're all good to go! I have installed packages such as neovim,
macvim, python 3 and many others.

## zsh
I use zsh as my main shell. To set up, use the command `chsh -s /bin/zsh` to
make zsh your default shell. If you would like to revert to your previous shell
just run the previous command again but replace `/bin/zsh` with the shell of
your choice. Then run the command `ln -s dotfiles/zsh/zshrc.symlink ~/.zshrc` to
make a soft link.

## vim & neovim
I use both Vim and Neovim depending on my needs. Vim has plugins that make it a
great light editor for almost any language but primarily for web development,
and Neovim on the other hand tweaked specifically for C/C++ and Javascript with
the YouCompleteMe plugin.

## tmux
tmux is a great tool that I use to manage multiple terminal sessions all while
being able to keep my hands on my keyboard instead of having to reach for a
mouse. To set up run the command `ln -s dotfiles/tmux/tmux.conf.symlink
~/.tmux.conf``

## emacs
I currently use spacemacs, they are located in another repository that you can
find here: 

> TODO: update image of how it looks
## how it all looks
![alt text](images/pic1.png "Logo Title Text 1")
