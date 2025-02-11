# Set up the prompt
setopt histignorealldups # ignore duplicated commands history list
setopt sharehistory # share command history data
setopt always_to_end # cursor moved to the end in full completion

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
# zinit light-mode for \
    # zinit-zsh/z-a-rust \
    # zinit-zsh/z-a-as-monitor \
    # zinit-zsh/z-a-patch-dl \
    # zinit-zsh/z-a-bin-gem-node
### End of Zinit's installer chunk

zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

# reverse search thing
# zinit light marlonrichert/zsh-autocomplete

# vi mode
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

# pure theme
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure
# show git stash icon
zstyle :prompt:pure:git:stash show yes

# WSL only config
if uname -r | grep -iq 'Microsoft' ; then
    export USERPROFILE='/mnt/c/Users/zhyda'
    alias windots='/usr/bin/git --git-dir=$USERPROFILE/.dotfiles --work-tree=$USERPROFILE'
    alias open='wsl-open'
fi

# aliases
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ls='eza'
alias ll='ls -la'
alias cat='bat'
alias vim='nvim'

# tries first to complete the current word exactly as its written, before trying case-insensitive or other matches
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# highlight the current option in the menu list instead of filling it in the prompt
zstyle ':completion:*' menu select

# ssh-agent
load_ssh_agent ()
{
    if [ -z "$SSH_AUTH_SOCK"  ] ; then
        eval $(ssh-agent -s)
        ssh-add
        trap "kill $SSH_AGENT_PID" 0
        echo "SSH Agent loaded"
    else
        echo "SSH Agent already loaded"
    fi
}

function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# use nvim as manpager `:h Man`
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export EDITOR='nvim'
export VISUAL=$EDITOR
export PATH="/opt/homebrew/bin:$PATH"
export GPG_TTY=$(tty)
export TERM=xterm-256color

# navi shell widget
eval "$(navi widget zsh)"

# zoxide
eval "$(zoxide init zsh)"
alias cd='z'

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/scripts
export PATH=$PATH:$HOME/.local/bin
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

. "$HOME/.atuin/bin/env"

eval "$(atuin init zsh)"

eval "$(pay-respects zsh --alias)"

