# reload zsh config
alias reload!='source ~/.zshrc'

# IP addresses to quicly ssh to any of my desired servers
alias alucard="ssh chris@alucard.io"
alias unchartedzone="ssh chris@uncharted.zone"
alias bro="tmux -f ~/.dotfiles/tmux/bro.tmux.conf.symlink attach"
alias school="cd ~/Documents/chrisSchoolWork/spring2018"
alias pie="ssh chris@192.168.1.84" # Shortcut to ssh into my raspberry pie
alias manjaro="ssh chris@146.244.240.73"
alias david="ssh chris@104.236.150.168"
alias edoras="ssh cssc0092@edoras.sdsu.edu"
alias activateBoots="php -S localhost:8000"

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi

# tmux aliases
alias ta='tmux attach'
alias tls='tmux ls'
alias tat='tmux attach -t'
alias tns='tmux new-session -s'
alias tks="tmux kill-session"

# School
alias carroll="scp p2.c cssc0092@edoras.sdsu.edu:~/Two"

# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias ls="ls ${colorflag}"
alias l="ls -lah ${colorflag}"
#alias la="ls -AF ${colorflag}"
alias ll="ls -lFh ${colorflag}"
#alias lld="ls -l | grep ^d"
#alias rmf="rm -rf"

# Shortcut to quickly edit my vimrc
alias vimconf="vim ~/.dotfiles/vim/vimrc.symlink"

# Alias to quickly go to my dotfile directory
alias dot="cd ~/.dotfiles"

#Youtube Dowloader
alias getmp3="youtube-dl --extract-audio --audio-format mp3"

# Helpers
alias grep='grep --color=auto' # Add color support for grep
alias df='df -h' # disk free, in Gigabytes, not bytes
alias du='du -h -c' # calculate disk usage for a folder

# Applications
alias chrome="/Applications/Google\\ \\Chrome.app/Contents/MacOS/Google\\ \\Chrome"
alias nvim='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 10'"

