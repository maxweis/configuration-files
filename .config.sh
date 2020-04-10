#!/bin/sh

SITE="https://www.maxweis.me/files/"
PACKAGES="wget git neovim zsh bear"
PACKAGES_APT=$PACKAGES
PACKAGES_PACMAN=$PACKAGES

#check if root
if [ "$EUID" = 0 ]; then
    echo Do not run as root
    exit
fi

#install programs
if [ -f /usr/bin/apt ]; then
    sudo apt-get install $PACKAGES_APT
else if [ -f /bin/pacman ]; then
    sudo pacman -S $PACKAGES_PACMAN --needed
fi
fi

#setup vim
mkdir -p $HOME/.vim/backup $HOME/.vim/bundle $HOME/.vim/undo $HOME/.vim/autoload
wget $SITE/.vimrc -O $HOME/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#setup nvim
mkdir -p $HOME/.config/nvim
ln -s $HOME/.vimrc $HOME/.config/nvim/init.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -sL install-node.now.sh/lts | sudo bash
wget $SITE/coc-settings.json -O $HOME/.config/nvim/coc-settings.json
echo alias vim=\"nvim\" >> $HOME/.bashrc
echo export EDITOR=nvim >> $HOME/.bashrc

#setup zsh
wget $SITE/.zshrc -O $HOME/.zshrc
echo PATH=$PATH >> .zshrc

#setup root to user settings
sudo rm -rf /root/.vim /root/.vimrc /root/.zshrc
sudo ln -s $HOME/.vim /root/.vim
sudo ln -s $HOME/.vimrc /root/.vimrc
sudo ln -s $HOME/.zshrc /root/.zshrc
sudo mkdir -p /root/.config
sudo rm -rf /root/.config/nvim
sudo ln -s $HOME/.config/nvim /root/.config

#set shell as zsh
sudo chsh $USER -s /bin/zsh
