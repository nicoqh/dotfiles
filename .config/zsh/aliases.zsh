alias dotfiles="git --work-tree=$HOME/ --git-dir=$HOME/.local/share/dotfiles.git"

alias l='ls -lh --group-directories-first'
alias ll='ls -lAh --group-directories-first'
alias rm='rm -i'

alias v='vim'

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

alias greview='nvim `git diff --staged --name-only`'

alias adu='sudo apt update && sudo apt dist-upgrade'
alias aac='sudo apt autoclean'
alias aar='sudo apt autoremove'

alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'

alias notebook='cd ~/projects/notebook && nvim -c ":Files"'

alias t='todo.sh'
