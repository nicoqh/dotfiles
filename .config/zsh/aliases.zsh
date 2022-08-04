alias dotfiles="git --work-tree=$HOME/ --git-dir=$HOME/.local/share/dotfiles.git"

alias l='ls -lh --group-directories-first'
alias ll='ls -lAh --group-directories-first'
alias rm='rm -i'

alias v='vim'

if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

alias adu='sudo apt update && sudo apt dist-upgrade'
alias aac='sudo apt autoclean'
alias aar='sudo apt autoremove'

alias notebook='cd ~/projects/notebook && vim'

alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'
