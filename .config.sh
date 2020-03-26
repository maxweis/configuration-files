#!/bin/sh

SITE="www.maxweis.me/files/"
PACKAGES="wget git neovim zsh"
PACKAGES_APT=$PACKAGES
PACKAGES_PACMAN=$PACKAGES

#check if root
if [ "$EUID" = 0 ]; then
    echo Do not run as root
    exit
fi

#install programs
if [ -f /bin/apt ]; then
    sudo apt-get install $PACKAGES_APT
else if [ -f /bin/pacman ]; then
    sudo pacman -S $PACKAGES_PACMAN --needed
fi
fi

#setup vim
mkdir -p $HOME/.vim/backup $HOME/.vim/bundle $HOME/.vim/undo 
wget $SITE/.vimrc -O $HOME/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#setup nvim
mkdir -p $HOME/.config/nvim
ln -s $HOME/.vimrc $HOME/.config/nvim

#setup zsh
wget $SITE/.zshrc -O $HOME/.zshrc
echo PATH=$PATH >> .zshrc

#setup root to user settings
sudo ln -s $HOME/.vim /root/.vim
sudo ln -s $HOME/.vimrc /root/.vimrc
sudo ln -s $HOME/.zshrc /root/.zshrc

#set shell as zsh
sudo chsh $USER -s /bin/zsh
