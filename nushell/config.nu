$env.config.show_banner = false
$env.config.use_kitty_protocol = true
$env.config.filesize.unit = "metric"

alias c = clear
alias e = ^($env.EDITOR)
alias gc = git clone
alias gs = git st
alias l = eza -al --group-directories-first
alias j = just
alias t = task
alias rr = rustrover
alias yt = yt-dlp

def o [$path = "."] {
    ^open $path
}

#-------------------------------------------------------------------------------
# BREWFILE

# View the Brewfile
def bf [] {
    bat $env.HOMEBREW_BUNDLE_FILE
}

# View changes made to the Brewfile
def "bf diff" [] {
    cd ~/sys
    git diff Brewfile
}

# Write installed packages to Brewfile
def "bf sync" [] {
   brew bundle dump --force
   bf diff
}

# Upgrade packages listed in Brewfile
def "bf up" [] {
    brew bundle upgrade
}

# Uninstall all packages not listed in the Brewfile
def "bf clean" [] {
    brew bundle cleanup --force
}

#-------------------------------------------------------------------------------
# INTEGRATIONS

source ~/.cache/zoxide.nu
source ~/.cache/carapace.nu
