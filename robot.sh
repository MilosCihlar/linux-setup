#!/bin/bash

sudo apt update -y
sudo apt upgrade -y

sudo apt install git -y
sudo apt install vim -y
sudo apt install zsh -y
sudo apt install curl -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo apt install ranger -y
sudo apt install tmux -y
sudo apt install tmuxinator -y
sudo apt install fonts-powerline -y
sudo apt install fonts-hack-ttf -y
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
