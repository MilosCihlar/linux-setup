#!/bin/bash

sudo apt-get -y update

sudo apt install git -y
sudo apt install vim -y
sudo apt install i3 -y
sudo apt install zsh -y
sudo apt install curl -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
sudo apt install rxvt-unicode -y
sudo chsh -s $(which urxvt)
sudo apt install ranger -y
sudo apt install tmux -y
sudo apt install tmuxinator -y
sudo apt install fonts-powerline -y
sudo apt install fonts-hack-ttf -y

