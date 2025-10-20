# Homebrew
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

# Added by Windsurf
export PATH="/Users/cvaldez/.codeium/windsurf/bin:$PATH"

# check for custom bin directory and add to path
if [[ -d ~/bin ]]; then
    export PATH=~/bin:$PATH
fi

if [[ -d ~/config/emacs/bin ]]; then
    export PATH=~/.config/emacs/bin:$PATH
fi

# adding path directory for custom scripts
export PATH=$DOTFILES/bin:$PATH
