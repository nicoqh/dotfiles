Dotfiles
------------

* Creates symlinks to dotfiles in your home directory
* Installs [Zsh](http://www.zsh.org) and [Oh-My-Zsh](https://github.com/robbyrussell/oh-my-zsh)
* Installs [Vundle](https://github.com/gmarik/vundle) for Vim and runs `vim +PluginInstall +qall`

Installation
------------

``` bash
git clone https://github.com/dnixx/dotfiles.git ~/dotfiles
cd ~/dotfiles
./makedotfiles.sh
chsh -s /bin/zsh
```
