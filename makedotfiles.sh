#!/bin/bash

#################################################
#
# Creates symlinks in your home directory
# to dotfiles in ~/dotfiles.
#
#################################################

# Dotfiles directory
dir=~/dotfiles

# Backup directory for old dotfiles
backupdir=~/dotfiles_old

ask() {
    printf "\e[0;33m$1 \e[0m"
    read
}

install_dotfile() {
    # Move existing dotfile to the backup directory
    # and replace it with a symlink.
    local src=$1 dst=$2

    if [ ! -h ~/.$dst  ]; then
        if [ -f ~/.$dst ]; then
            mv ~/.$dst $backupdir/$src
        fi

        echo "Creating symlink to $1: ~/.$2"
        ln -s $dir/$src ~/.$dst
    fi
}

setup_local_gitconfig() {
    if [ ! -f ~/.gitconfig.local ]; then
        # Create a local gitconfig (~/.gitconfig.local)
        echo "Creating a local ~/.gitconfig.local"

        ask "What is your Git name?"
        git_name=$REPLY
        ask "What is your Git email?"
        git_email=$REPLY
        echo -e "[user]\n    name = $git_name\n    email = $git_email" > ~/.gitconfig.local
    fi
}

install_vundle () {
    # Make swap dir for vim
    if [ ! -d ~/.vimswap/ ]; then
        mkdir ~/.vimswap
    fi

    # Install Vundle
    if [ ! -d ~/.vim/bundle/Vundle.vim/.git ] && [ ! -f ~/.vim/bundle/Vundle.vim/.git ]; then
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
        # Install Plugins
        vim +PluginInstall +qall
    fi
}

install_oh-my-zsh () {
    cd $dir
    if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
        if [[ ! -d $dir/oh-my-zsh/ ]]; then
            echo "Cloning robbyrussell/oh-my-zsh"
            git clone http://github.com/robbyrussell/oh-my-zsh.git
        else
            echo "Oh-My-Zsh installed."
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

# Create the backup directory
echo "Creating $backupdir to back up any existing dotfiles."
mkdir -p $backupdir

cd $dir

# Set up gitconfig
setup_local_gitconfig

# Install dotfiles
install_dotfile "vimrc"               "vimrc"
install_dotfile "zshrc"               "zshrc"
install_dotfile "gitconfig"           "gitconfig"
install_dotfile "oh-my-zsh"           "oh-my-zsh"
install_dotfile "npmrc"               "npmrc"
install_dotfile "terminator.config"   "config/terminator/config"

# Install Oh-My-Zsh
install_oh-my-zsh

# Install Vundle
install_vundle

echo ""
echo -e "\e[42;97m        Done!        \e[0m"
