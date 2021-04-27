#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'export PATH="/opt/homebrew/bin:$PATH"' >> $HOME/.zshrc
export PATH="/opt/homebrew/bin:$PATH"

softwareupdate --install-rosetta # required for docker
brew install node tmux neovim exa bat ripgrep code jq wget poetry tree docker-compose ctags go gnupg
brew install --cask visual-studio-code iterm2 telegram whatsapp obsidian docker

pip3 install --user jedi black pylint isort jedi-language-server

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

