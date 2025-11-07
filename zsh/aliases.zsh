
#  █████╗ ██╗     ██╗ █████╗ ███████╗███████╗███████╗
# ██╔══██╗██║     ██║██╔══██╗██╔════╝██╔════╝██╔════╝
# ███████║██║     ██║███████║███████╗█████╗  ███████╗
# ██╔══██║██║     ██║██╔══██║╚════██║██╔══╝  ╚════██║
# ██║  ██║███████╗██║██║  ██║███████║███████╗███████║
# ╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝

# reload zsh config
alias reload!='source ~/.zshrc'

# IP addresses to quicly ssh to any of my desired servers
alias alucard="ssh chris@alucard.io"
alias unchartedzone="ssh chris@uncharted.zone"
alias pie="ssh chris@192.168.1.84" # Shortcut to ssh into my raspberry pie
alias david="ssh chris@104.236.150.168"
alias edoras="ssh cssc0092@edoras.sdsu.edu"
alias zeroPie="ssh chris@192.168.0.2"

# alias to run tmux profile script
alias bro="tmux -f ~/.dotfiles/tmux/bro.tmux.conf.symlink attach"

# start php local server, named after my cat :)
alias activateBoots="php -S localhost:8000"

# tmux aliases
alias ta='tmux attach -t'
alias tls='tmux ls'
alias tns='tmux new-session -s'
alias tks="tmux kill-session"

# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias ls="ls --color"
alias l="ls -lah --color"
#alias la="ls -AF ${colorflag}"
alias ll="ls -lFh --color"
#alias lld="ls -l | grep ^d"
#alias rmf="rm -rf"

# Alias to quickly go to my dotfile directory
alias dot="cd ~/.dotfiles"

# Lazygit
alias lg="lazygit"

# git
alias gs="git status"
alias gf="git fetch"
alias gp="git push"

# Helpers
alias grep='grep --color=auto' # Add color support for grep
alias df='df -h' # disk free, in Gigabytes, not bytes
alias du='du -h -c' # calculate disk usage for a folder

# Docker
alias dpa="docker ps --all"

# Applications
alias chrome="/Applications/Google\\ \\Chrome.app/Contents/MacOS/Google\\ \\Chrome"
alias nvim='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 10'"

alias smc="~/batcave/boost-api/bin/smc"
