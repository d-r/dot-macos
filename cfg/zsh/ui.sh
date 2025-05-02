# Set prompt to the current path in blue
export PROMPT="%F{blue}%~>%f "

# Store up to 10000 entries of history in ~/.zhistory
export HISTFILE="$HOME/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000
setopt HIST_SAVE_NO_DUPS

# Enable syntax highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Enable completion
autoload -U compinit; compinit
_comp_options+=(globdots) # Complete dotfiles

# Enable Carapace
# https://carapace.sh/
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
zstyle ':completion:*:git:*' group-order 'main commands' 'alias commands' 'external commands'
source <(carapace _carapace)

# Enable Zoxide
# https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init zsh)"

#-------------------------------------------------------------------------------
# ALIASES

alias c='clear'
alias e=$EDITOR
alias j='just'
alias ls='eza -al --group-directories-first'
alias rr='rustrover'
alias t='task'
alias yt='yt-dlp'

# Wrapper around `yazi` to change current working directory on exit
# https://yazi-rs.github.io/docs/quick-start/
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}
