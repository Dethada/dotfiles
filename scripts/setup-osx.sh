#!/bin/bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'export PATH="/opt/homebrew/bin:$PATH"' >> $HOME/.zshrc
export PATH="/opt/homebrew/bin:$PATH"

softwareupdate --install-rosetta # required for docker

brew tap homebrew/cask-fonts
brew install node tmux neovim exa bat ripgrep code jq fd wget poetry tree docker-compose ctags go gnupg fzf gh svn \
             lf poppler navi exiftool highlight youtube-dl openjdk jdtls google-java-format clojure entr sox grip zoxide
brew install --cask visual-studio-code iterm2 telegram whatsapp obsidian docker insomnia \
    unnaturalscrollwheels font-hack-nerd-font mactex-no-gui skim zotero discord zoom \
    betterdisplay protonvpn figma rectangle transmission

pip3 install --user jedi black pylint isort jedi-language-server pdftotext

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

$HOME/.tmux/plugins/tpm/bin/install_plugins

# install nvim plugins
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

# cht.sh script
curl https://cht.sh/:cht.sh -o $HOME/scripts/cht-core.sh

# display full path in finder
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
