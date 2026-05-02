# Dotfiles

Clone this repo
```bash
git clone --bare https://github.com/Dethada/dotfiles.git $HOME/.dotfiles
```

Add the following to your `.bashrc` and source it.
```bash
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# optional use nvim as manpager `:h Man`
export MANPAGER='nvim +Man!'
export MANWIDTH=999
```

Checkout the files
```bash
# ignore untracked files
dotfiles config --local status.showUntrackedFiles no

dotfiles checkout
```

Run the setup script
```bash
~/setup-arch.sh
```

### Nvim
Required to compile treesitter parsers
```
cargo binstall tree-sitter-cli
```

### Tmux
Press prefix + I (capital i, as in Install) to fetch plugins.

## Common
- Shell: zsh
- Terminal: wezterm
- Editor: neovim
- File manger: yazi

## Linux
- WM: hyprland
- Bar: ashell

## Windows
https://github.com/Dethada/windots

