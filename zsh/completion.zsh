# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

# default to file completion
# zstyle ':completion:*' completer _expand _complete _files _correct _approximate

# Load completions
autoload -U compinit && compinit

zinit cdreplay -q

# Completion Styling
# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
