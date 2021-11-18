#!/bin/bash

# update cht.sh script
curl https://cht.sh/:cht.sh -o $HOME/scripts/cht-core.sh

# update homebrew packages
brew upgrade
brew upgrade --cask

# update rust
rustup update

# update pip packages
pip3 list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U

# update tpm
cd $HOME/.tmux/plugins/tpm
git pull

# update and remove unused plugins
$HOME/.tmux/plugins/tpm/bin/clean_plugins
$HOME/.tmux/plugins/tpm/bin/update_plugins all

# vim plugins
nvim --headless +PlugClean! +qall
nvim --headless +PlugUpdate +qall
nvim --headless +PlugUpgrade +qall

zinit update

echo 'Sudoing...'
sudo softwareupdate -l
