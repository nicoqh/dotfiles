#!/bin/bash

# Local gitconfig path
GITCONFIG_LOCAL=~/.config/git/config.local

# Alias for git operations
DOTFILES_GIT_COMMAND="git --work-tree=$HOME/ --git-dir=$HOME/.local/share/dotfiles.git"


#####################################


ask() {
    printf "\e[0;33m$1 \e[0m"
    read
}

setup_local_gitconfig() {
    if [ ! -f $GITCONFIG_LOCAL ]; then
        echo "Creating a local $GITCONFIG_LOCAL"

        ask "What is your Git name?"
        git_name=$REPLY
        ask "What is your Git email?"
        git_email=$REPLY
        echo -e "[user]\n    name = $git_name\n    email = $git_email" > $GITCONFIG_LOCAL
    fi
}

install_oh-my-zsh () {
    if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
        if [[ ! -d $dir/oh-my-zsh/ ]]; then
            echo "Cloning robbyrussell/oh-my-zsh"
            git clone --depth=1 http://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
        else
            echo "Oh-My-Zsh already installed."
        fi

        ask "Do you want to make Zsh your default shell?"
        if [[ "$REPLY" =~ ^[Yy]$  ]]; then
            chsh -s $(which zsh)
        fi
    else
        echo -e "\nZsh is not installed. Installing ..."
        sudo apt-get install zsh
        install_oh-my-zsh
    fi
}


#####################################


ask "This will override files with the same name as those in the repository. Continue?"

if [[ ! "$REPLY" =~ ^[Yy]$  ]]; then
    echo "Exit."
    exit
fi

# Add the dotfiles to the home directory and override existing files
$DOTFILES_GIT_COMMAND reset HEAD
$DOTFILES_GIT_COMMAND checkout ~

setup_local_gitconfig

install_oh-my-zsh
