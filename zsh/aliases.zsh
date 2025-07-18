#
#  █████╗ ██╗     ██╗ █████╗ ███████╗███████╗███████╗
# ██╔══██╗██║     ██║██╔══██╗██╔════╝██╔════╝██╔════╝
# ███████║██║     ██║███████║███████╗█████╗  ███████╗
# ██╔══██║██║     ██║██╔══██║╚════██║██╔══╝  ╚════██║
# ██║  ██║███████╗██║██║  ██║███████║███████╗███████║
# ╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝
#
# reload zsh config
alias reload!='source ~/.zshrc'

# tmux aliases
alias ta='tmux attach -t'
alias tls='tmux ls'
alias tat='tmux attach -t'
alias tns='tmux new-session -s'
alias tks="tmux kill-session"
alias start-dev="tmux -f ~/.dotfiles/tmux/dev.tmux.conf attach -t dev"
alias bro="tmux -f ~/.dotfiles/tmux/scripts/bro.tmux.conf attach -t bro"
alias work="tmux -f ~/.dotfiles/tmux/scripts/work.tmux.conf attach -t work"

# ssh aliases
alias unchartedzone="ssh chris@uncharted.zone"

# Filesystem aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias dot="cd ~/.dotfiles"
alias dev="cd ~/batcave"
alias ls="ls -lG"
alias l="ls -laG"

# git aliases
alias ga='git add'
alias gb='git branch'
alias gdiff='git diff'
alias gds='git diff --staged'
alias glog="git log"
alias gpull='git pull'
alias gpush='git push'
alias gs='git status'

# chmod fixer
alias repair-dirs="find . -type d -exec chmod 755 {} \;"
alias repair-files="find . -type f -exec chmod 644 {} \;"

# chatmeter aliases
alias cma="chatmeter_run assets"
alias cmad="chatmeter_run assets --connect-local dashboard"
alias cmadw="chatmeter_run assets --connect-local dashboard workflow"
alias cmda="chatmeter_run dashboard --connect-local assets"
alias cmdda="chatmeter_run dashboard -d --connect-local assets"
alias cmdaw="chatmeter_run dashboard --connect-local assets workflow"
alias cmdas="chatmeter_run dashboard --dashboard-social-publishing-id chrisChatterPostsToBePublished-deleteme --connect-local assets"
alias cmdaws="chatmeter_run dashboard --dashboard-social-publishing-id chrisChatterPostsToBePublished-deleteme --connect-local assets workflow"
alias cmdah="chatmeter_run dashboard --connect-local assets html-renderer"
alias cmwd="chatmeter_run workflow --connect-local dashboard"
alias cmaw="chatmeter_run assets --connect-local workflow"
alias cms="chatmeter_run scripts"
# alias cmsd="sbt -mem 8192 -jvm-debug 5005 -Duser.timezone=UTC -Dnoalpn=true -Dconfig.file=/Users/cvaldez/batcave/deploy-utility/aws_configs/jobmanager/dev-local/application.conf devScripts/run"

alias local-dashboard-ui="yarn && API_URL=http://localhost:9000 NOTIFICATIONS_API_URL=http://localhost:9001 THEME_API_URL=https://dev-themes.chatmeter.com yarn start"
alias local-dashboard="sbt -mem 8192 -Duser.timezone=UTC -Dworkflow.apiUrl=http://localhost:9001 -Dapp.assetUrl=http://localhost:8530 -DskipGulp=true -Dplay.server.netty.transport=jdk -DsocialPublishing.active=true -DsocialPublishing.mongoCollection=chrisChatterPostsToBePublished-deleteme -Dqueue.localQueues.locationUpdateJobsToProcess=true -Dqueue.localQueues.postContextsToBePublished=true -Dconfig.file=/Users/cvaldez/batcave/deploy-utility/aws_configs/dashboard/dev-local/application.conf dashboard/run"
alias debug-dashboard="sbt -mem 8192 -jvm-debug 5005 -Duser.timezone=UTC -Dapp.assetUrl=http://localhost:8530 -DskipGulp=true -Dplay.server.netty.transport=jdk -Dqueue.localQueues.locationUpdateJobsToProcess=true -Dconfig.file=/Users/cvaldez/batcave/deploy-utility/aws_configs/dashboard/dev-local/application.conf dashboard/run"
alias debug-dashboard-social="sbt -mem 8192 -jvm-debug 5005 -Duser.timezone=UTC -Dapp.assetUrl=http://localhost:8530 -DskipGulp=true -Dplay.server.netty.transport=jdk -DsocialPublishing.active=true -DsocialPublishing.mongoCollection=chrisChatterPostsToBePublished-deleteme -Dqueue.localQueues.locationUpdateJobsToProcess=true -Dqueue.localQueues.postContextsToBePublished=true -Dconfig.file=/Users/cvaldez/batcave/deploy-utility/aws_configs/dashboard/dev-local/application.conf dashboard/run"

# Download youtube videos
alias getmp3="youtube-dl --extract-audio --audio-format mp3"

# SSH shortcuts
alias pie="ssh pi@raspberrypi.local"
alias chris-pie="ssh chris@raspberrypi.local"
alias cs-go="ssh -i ~/.ssh/csgo.pem ubuntu@3.135.100.218 "

# Tailscale
alias start-tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
# Docker
alias start-docker="/Applications/Docker.app/Contents/MacOS/Docker"
# Format SBT Project
alias format-sbt-project="sbt \"cross-project --all -- scalafmtAll\""

