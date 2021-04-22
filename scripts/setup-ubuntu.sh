#!/bin/bash

# only tested for pop os

## vim and terminal setup

# install alacritty and other useful tools
# sudo add-apt-repository ppa:mmstick76/alacritty # only needed for ubuntu
sudo apt install -y alacritty bat jq curl git

# install powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1 /tmp/fonts
/tmp/fonts/install.sh
rm -rf /tmp/fonts

# install zsh
sudo apt install -y zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
sudo chsh -s $(which zsh) $USER

# install neovim and dependencies
sudo apt install -y universal-ctags neovim nodejs npm tmux python3-pip

# coc-python dependencies
pip3 install --user jedi black

# install vscode
sudo snap install --classic code

## awesome wm setup
sudo apt install -y awesome

## bspwm setup
sudo apt install -y bspwm dmenu feh

sudo snap install --edge --devmode polybar-git

sudo snap alias polybar-git polybar

# yabar
# build dependencies
sudo apt-get install -y libcairo2-dev libpango1.0-dev libconfig-dev libxcb-randr0-dev libxcb-ewmh-dev libxcb-icccm4-dev libgdk-pixbuf2.0-dev libasound2-dev libiw-dev libxkbcommon-dev libxkbcommon-x11-dev libxcb-xkb-dev

git clone https://github.com/geommer/yabar
cd yabar
make yabar
cp doc/yabar.1.asciidoc doc/yabar.1
sudo make install

