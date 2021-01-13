#
#  █████╗ ██╗     ██╗ █████╗ ███████╗███████╗███████╗
# ██╔══██╗██║     ██║██╔══██╗██╔════╝██╔════╝██╔════╝
# ███████║██║     ██║███████║███████╗█████╗  ███████╗
# ██╔══██║██║     ██║██╔══██║╚════██║██╔══╝  ╚════██║
# ██║  ██║███████╗██║██║  ██║███████║███████╗███████║
# ╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝

# reload zsh config
alias reload!='source ~/.zshrc'

# ssh aliases
alias unchartedzone="ssh chris@uncharted.zone"

# tmux aliases
alias ta='tmux attach'
alias tls='tmux ls'
alias tat='tmux attach -t'
alias tns='tmux new-session -s'
alias tks="tmux kill-session"

# alias to run tmux profile script
alias bro="tmux -f ~/.dotfiles/tmux/bro.tmux.conf.symlink attach"

# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias dot="cd ~/.dotfiles"
alias dev="cd ~/Workshop"
alias l="ls -l"
alias la="ls -la"

# git aliases
alias ga='git add'
alias gb='git branch'
alias gdiff='git diff'
alias glog="git log"
alias gpull='git pull'
alias gpush='git push'
alias gs='git status'
