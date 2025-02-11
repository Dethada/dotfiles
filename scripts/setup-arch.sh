#!/bin/bash

# install packages
sudo pacman -Sy --noconfirm neovim universal-ctags tmux nodejs npm base-devel clang \
    openssh zsh tmux eza bat ripgrep jq fd wget tree docker docker-compose go fzf svn \
    lf poppler navi highlight yt-dlp entr zoxide unzip imagemagick ffmpeg p7zip yazi \
    wezterm \
    python python-pip python-black python-isort

paru -S pay-respects-bin

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

$HOME/.tmux/plugins/tpm/bin/install_plugins

# chinese font
# yes | yay -S --nodiffmenu --noeditmenu --nouseask --nocleanmenu --noupgrademenu noto-fonts-sc
