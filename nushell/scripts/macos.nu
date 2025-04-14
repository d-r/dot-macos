alias o = open
alias open = ^open
alias here = open .

#-------------------------------------------------------------------------------
# BREWFILE

# View the Brewfile
def bf [] {
    bat $env.HOMEBREW_BUNDLE_FILE
}

# View changes made to the Brewfile
def "bf diff" [] {
    cd ($env.HOMEBREW_BUNDLE_FILE | path dirname)
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
