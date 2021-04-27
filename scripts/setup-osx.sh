#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'export PATH="/opt/homebrew/bin:$PATH"' >> $HOME/.zshrc
export PATH="/opt/homebrew/bin:$PATH"

brew install node tmux neovim exa bat ripgrep code jq wget poetry
brew install --cask visual-studio-code iterm2
