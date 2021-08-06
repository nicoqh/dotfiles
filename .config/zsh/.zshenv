# This will discard duplicates
typeset -U PATH path
path=(~/.local/share/npm-global/bin ~/.config/composer/vendor/bin "$path[@]")
export PATH

export XDG_CONFIG_HOME=$HOME/.config
