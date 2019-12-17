alias l='ls -lh --group-directories-first'
alias ll='ls -lAh --group-directories-first'
alias rm='rm -i'

alias v='nvim'

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

alias dotfiles="git --work-tree=$HOME/ --git-dir=$HOME/.local/share/dotfiles.git"
