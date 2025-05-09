# I used to have most of this in .zshenv, but I moved it here instead,
# based on the advice given by this article:
# https://mac.install.guide/terminal/zshrc-zprofile

eval "$(/opt/homebrew/bin/brew shellenv)"
. "$HOME/.cargo/env"

export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.data"
export XDG_STATE_HOME="$HOME/.state"
export XDG_MUSIC_DIR="$HOME/media/audio"

export HOMEBREW_BUNDLE_FILE="$XDG_CONFIG_HOME/Brewfile"

export LANG="en_IE.UTF-8"
export LC_ALL=$LANG
export LC_COLLATE=$LANG
export LC_CTYPE=$LANG
export LC_MESSAGES=$LANG
export LC_MONETARY=$LANG
export LC_NUMERIC=$LANG
export LC_TIME=$LANG

export EDITOR="micro"
export TERM="xterm-256color"
export MANPAGER="sh -c 'col -bx | bat -l man -p'" # Colorize man pages
