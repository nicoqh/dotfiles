source /usr/share/doc/fzf/examples/key-bindings.zsh
source /usr/share/doc/fzf/examples/completion.zsh

# Ag respects .gitignore etc. by default
export FZF_DEFAULT_COMMAND='ag -g ""'

# Alt+C preview of directories
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
