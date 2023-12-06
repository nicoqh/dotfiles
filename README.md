# Dotfiles

## Installation

Clone the dotfiles repo:

```bash
git clone --bare https://github.com/nicoqh/dotfiles.git ~/.local/share/dotfiles.git
```

Reset and checkout the working directory (your home directory).
NB: This will override files with the same name as those in the repository.

```
alias dotfiles="git --work-tree=$HOME/ --git-dir=$HOME/.local/share/dotfiles.git"
dotfiles config --local status.showUntrackedFiles no
dotfiles reset HEAD
dotfiles checkout ~
```

### Further setup

Run `~/bin/setupenv.sh`. This script will:

- Install common packages with apt
- Create a local/private config file for Git
- Install Zsh and Oh My Zsh

## Adding and editing dotfiles

`dotfiles` is aliased to `git --work-tree=$HOME/ --git-dir=$HOME/.local/share/dotfiles.git` in `.zshrc`.

To stage and commit dotfiles:

```bash
dotfiles add <file>
dotfiles commit -m "<message>"
```

If you decide to add a `.gitignore` that ignores everything, you must use the `-f` flag when staging files.
