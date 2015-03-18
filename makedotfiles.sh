#!/bin/bash
############################
# Creates symlinks from the home directory to dotfiles in ~/dotfiles
############################

## Variables

dir=~/dotfiles                      # dotfiles directory
olddir=~/dotfiles_old               # dotfiles backup directory
files="vimrc zshrc oh-my-zsh"       # list of files/folders to symlink in home directory

############################

# Create dotfiles_old in home directory
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir

# Move any existing dotfiles in homedir to dotfiles_old directory, and create symlinks
cd $dir
for file in $files; do
	mv ~/.$file ~/dotfiles_old/
	echo "Creating symlink to $file in home directory."
	ln -s $dir/$file ~/.$file
done

install_oh-my-zsh () {
	cd $dir
	if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
		if [[ ! -d $dir/oh-my-zsh/ ]]; then
			echo "Cloning robbyrussell/oh-my-zsh"
			git clone http://github.com/robbyrussell/oh-my-zsh.git
		else
			echo "Oh-My-Zsh installed."
		fi
		# chsh -s $(which zsh)
	else
		echo -e "\nZsh is not installed. Installing ..."
		sudo apt-get install zsh
		install_oh-my-zsh
	fi
}

install_oh-my-zsh

echo "Done."
