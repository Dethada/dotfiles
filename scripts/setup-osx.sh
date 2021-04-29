#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'export PATH="/opt/homebrew/bin:$PATH"' >> $HOME/.zshrc
export PATH="/opt/homebrew/bin:$PATH"

softwareupdate --install-rosetta # required for docker
brew install node tmux neovim exa bat ripgrep code jq fd wget poetry tree docker-compose ctags go gnupg fzf vifm
brew install --cask visual-studio-code iterm2 telegram whatsapp obsidian docker insomnia

pip3 install --user jedi black pylint isort jedi-language-server

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

$HOME/.tmux/plugins/tpm/bin/install_plugins
