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
        terminator \
        kitty \
        htop \
        httpie \
        curl \
        tree \
        tig \
        silversearcher-ag \
        fzf
        neofetch \
        fonts-powerline # https://github.com/powerline/fonts/issues/281#issuecomment-570365146
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
        php8.1-fpm \
        php8.1-cli \
        php8.1-mysql \
        php8.1-curl \
        php8.1-gd \
        php8.1-intl \
        php8.1-mcrypt \
        php8.1-xml \
        php8.1-mbstring \
        php8.1-bz2 \
        php8.1-zip

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
        if [[ "$REPLY" =~ ^[Yy]$  ]]; then
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

    curl -fLo "RobotoMono.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/RobotoMono.zip \
        && unzip -o RobotoMono.zip \
        && rm -f RobotoMono.zip

    curl -fLo "Hack.zip" https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip \
        && unzip -o Hack.zip \
        && rm -f Hack.zip

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
