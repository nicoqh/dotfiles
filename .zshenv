# This will discard duplicates
typeset -U PATH path
path=(~/.npm-global/bin ~/.config/composer/vendor/bin "$path[@]")
export PATH

ZDOTDIR=$HOME/.config/zsh
# . $ZDOTDIR/.zshenv
