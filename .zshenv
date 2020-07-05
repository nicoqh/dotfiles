# This will discard duplicates
typeset -U PATH path
path=(~/.local/share/npm-global/bin ~/.local/share/composer/vendor/bin "$path[@]")
export PATH

ZDOTDIR=$HOME/.config/zsh
# . $ZDOTDIR/.zshenv
