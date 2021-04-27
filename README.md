# Dotfiles

Clone this repo
```bash
git clone --bare https://github.com/PotatoDrug/dotfiles.git $HOME/.dotfiles
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
~/setup-system.sh
```

## OSX

Use [karabiner-elements](https://github.com/pqrs-org/Karabiner-Elements) to modify key mappings (Useful for using colemak layout).

## Vim Notes
```
# change line surrounding to "
yss"

# change surrounding ' to "
cs'"

# go to matching bracket etc
%

# subsitute in the whole file
:%s/old/new/g

# Splits
Ctrl+W, S (upper case) for horizontal splitting

Ctrl+W, v (lower case) for vertical splitting

# list buffers
:ls

# switch to buffer
:b <buffer id/name>

# cycle buffer
<TAB> and Shift-<Tab>

# new empty buffer
:enew

# new empty buffer in split (orientation defined by set splitbelow and set splitright)
:new

# close buffer
:bd <optional buffer id/name>

# jump to file if a file path is at cursor
gf

# jump back
Ctrl-o

# jump forward
Ctrl-i
```
