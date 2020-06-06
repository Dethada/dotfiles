#!/bin/bash

# only tested for ubuntu

# install alacritty
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt install -y alacritty

# install powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1 /tmp/fonts
/tmp/fonts/install.sh
rm -rf /tmp/fonts

# install neovim and dependencies
sudo apt install -y universal-ctags nvim nodejs npm

# coc-python dependencies
pip3 install --user jedi black

