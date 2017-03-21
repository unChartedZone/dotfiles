# heavily inspired by the wonderful pure theme
# https://github.com/sindresorhus/pure

# needed to get things like current git branch
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git # You can add hg too if needed: `git hg`
zstyle ':vcs_info:git*' use-simple true
zstyle ':vcs_info:git*' max-exports 2
zstyle ':vcs_info:git*' formats ' %b' 'x%R'
zstyle ':vcs_info:git*' actionformats ' %b|%a' 'x%R'
autoload colors && colors


git_dirty() {
    ## check if we're in a git repo
    command git rev-parse --is-inside-work-tree &>/dev/null || return

    # check if it's dirty
    command git diff --quiet --ignore-submodules HEAD &>/dev/null;
    if [[ $? -eq 1 ]]; then
        echo "%F{red}✗%f"
		#echo "${fg[red]}✗"
    else
        echo "%F{green}✔%f"
		#echo "${fg[green]}✔"
    fi
}

# get the status of the current branch and it's remote
# If there are changes upstream, display a ⇣
# If there are changes that have been committed but not yet pushed, display a ⇡
git_arrows() {
    # do nothing if there is no upstream configured
    command git rev-parse --abbrev-ref @'{u}' &>/dev/null || return

    local arrows=""
    local status
    arrow_status="$(command git rev-list --left-right --count HEAD...@'{u}' 2>/dev/null)"
	number_of_commits_ahead="$(git rev-list --left-right --count master...origin/master | awk '{print$1}')"
    # do nothing if the command failed
    (( !$? )) || return

    # split on tabs
    arrow_status=(${(ps:\t:)arrow_status})
    local left=${arrow_status[1]} right=${arrow_status[2]}

    (( ${right:-0} > 0 )) && arrows+="%F{011}⇣%f"
    (( ${left:-0} > 0 )) && arrows+="%F{012}⇡%f"

    echo $arrows 
}

git_branch() {
	temp="%F{241}$vcs_info_msg_0_%f"
	echo $temp
}

# Enable vi mode
bindkey -v

# function zle-line-init zle-keymap-select {
#     VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]% %{$reset_color%}"
# 	RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $(git_custom_status) $EPS1"
# 	zle reset-prompt
# }

function zle-line-init zle-keymap-select {
    VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]% %{$reset_color%}"
	RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $(git_dirty)$(git_branch) $(git_arrows) $EPS1"
	zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

precmd() {
    vcs_info
    print -P '\n%F{blue}%~'
}

# export PROMPT='%(?.%F{yellow}.%F{blue})➤ (?.%F{yellow}.%F{blue})➤ ➤%f '
export PROMPT='%(?.%F{227}.%F{blue})⚡︎%f '
# export PROMPT='%(?.%F{199}.%F{blue})➤%f '
export RPROMPT='`git_dirty`%F{241}$vcs_info_msg_0_%f `git_arrows` '
