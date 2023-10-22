#!/bin/bash

# Local gitconfig path
GITCONFIG_LOCAL=~/.config/git/config.local


#####################################


ask() {
    printf "\e[0;33m$1 \e[0m"
    read
}

install_common_packages() {
    echo -e "\nInstalling common packages ..."

    sudo apt-get update && sudo apt-get install \
        kitty \
        htop \
        httpie \
        curl \
        tree \
        tig \
        silversearcher-ag \
        fzf
        neofetch \
        git-quick-stats \
}

install_neovim() {
    echo -e "\nInstalling Neovim ..."

    sudo sudo add-apt-repository ppa:neovim-ppa/stable \
        && sudo apt-get update \
        && sudo apt install neovim
}

install_php() {
    echo -e "\nInstalling PHP ..."

    sudo LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php \
        && sudo apt-get update && sudo apt-get install \
        php8.2-cli \
        php8.2-mysql \
        php8.2-curl \
        php8.2-gd \
        php8.2-intl \
        php8.2-mcrypt \
        php8.2-xml \
        php8.2-mbstring \
        php8.2-bz2 \
        php8.2-zip

    ask "Do you need PHP FPM?"
    if [[ "$REPLY" =~ ^[Yy]$ ]]; then
        sudo apt install php8.2-fpm
    fi

    # https://getcomposer.org/doc/faqs/how-to-install-composer-programmatically.md
    EXPECTED_CHECKSUM="$(php -r 'copy("https://composer.github.io/installer.sig", "php://stdout");')"
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    ACTUAL_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

    if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]
    then
        >&2 echo 'ERROR: Invalid installer checksum'
        rm composer-setup.php
        exit 1
    fi

    php composer-setup.php --quiet

    rm composer-setup.php

    sudo mv composer.phar ~/bin/composer
}

install_node() {
    echo -e "\nInstalling NodeJS ..."

    curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
    sudo apt-get install nodejs
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
        if [[ ! -d ~/.oh-my-zsh/ ]]; then
            echo "Cloning robbyrussell/oh-my-zsh"
            git clone --depth=1 http://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
        else
            echo "Oh-My-Zsh is already installed."
        fi

        ask "Do you want to make Zsh your default shell?"
        if [[ "$REPLY" =~ ^[Yy]$ ]]; then
            chsh -s $(which zsh)
        fi
    else
        echo -e "\nZsh is not installed. Installing ..."
        sudo apt-get install zsh
        install_oh-my-zsh
    fi
}

install_fonts () {
    mkdir -p ~/.local/share/fonts/nerd
    cd ~/.local/share/fonts/nerd

    curl -fLo "RobotoMono.zip" https://github.com/ryanoasis/nerd-fonts/releases/latest/download/RobotoMono.zip \
        && unzip -o RobotoMono.zip \
        && rm -f RobotoMono.zip

    curl -fLo "Hack.zip" https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip \
        && unzip -o Hack.zip \
        && rm -f Hack.zip

    curl -fLo "FiraCode.zip" https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip \
        && unzip -o FiraCode.zip \
        && rm -f FiraCode.zip

    fc-cache -vf ~/.local/share/fonts
}


#####################################


install_common_packages

install_neovim

install_php

install_node

setup_local_gitconfig

install_oh-my-zsh

install_fonts
