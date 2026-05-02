# Environment Variables
export EDITOR='nvim'
export VISUAL=$EDITOR
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export TERM=xterm-256color
export GPG_TTY=$(tty)

# PATH modifications
export PATH="/$HOME/tools/depot_tools:$PATH"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/scripts
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.cargo/bin
. "$HOME/.cargo/env"
