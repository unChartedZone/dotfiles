# reload zsh config
alias reload!='source ~/.zshrc'

# To quicly ssh to any of my desired servers
alias masc='TERM=xterm-256color ssh masc0089@rohan.sdsu.edu'
alias legolas='ssh valdez@legolas.sdsu.edu'
alias edoras="ssh cssc0038@edoras.sdsu.edu"
alias alucard="ssh chris@alucard.io"
alias unchartedzone="ssh chris@unchartedzone.me"
alias wordpress="ssh chris@138.68.246.123"
alias bro="tmux -f ~/.dotfiles/tmux/bro.tmux.conf.symlink attach"
alias school="cd ~/Documents/chrisSchoolWork/fall2017"
alias rscript="Rscript"
alias pie="ssh chris@192.168.1.84" # Shortcut to ssh into my raspberry pie
alias manjaro="ssh chris@146.244.240.73"
alias ice="ssh chris@107.170.209.236" #Server used for CS532 project
alias meteor_test_server="ssh chris@162.243.128.147"

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi


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
#alias grep='grep --color=auto'
#alias df='df -h' # disk free, in Gigabytes, not bytes
#alias du='du -h -c' # calculate disk usage for a folder

# Applications
#alias ios='open -a /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app'

# IP addresses
#alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
#alias localip="ipconfig getifaddr en1"
#alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# Flush Directory Service cache
#alias flush="dscacheutil -flushcache"

# View HTTP traffic
#alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
#alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Trim new lines and copy to clipboard
#alias trimcopy="tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
#alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# File size
#alias fs="stat -f \"%z bytes\""

# ROT13-encode text. Works for decoding, too! ;)
#alias rot13='tr a-zA-Z n-za-mN-ZA-M'

# Empty the Trash on all mounted volumes and the main HDD
#alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash"

# Hide/show all desktop icons (useful when presenting)
#alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
#alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# One of @janmoesen’s ProTip™s
#for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
#    alias "$method"="lwp-request -m '$method'"
#done

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
#alias stfu="osascript -e 'set volume output muted true'"
#alias pumpitup="osascript -e 'set volume 10'"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
#alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

alias chrome="/Applications/Google\\ \\Chrome.app/Contents/MacOS/Google\\ \\Chrome"

alias nvim='NVIM_TUI_ENABLE_TRUE_COLOR=1 nvim'
