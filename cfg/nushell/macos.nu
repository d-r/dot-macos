alias o = open
alias open = ^open
alias here = open .

#-------------------------------------------------------------------------------

# Read Brewfile
def pk [] {
    bat $env.HOMEBREW_BUNDLE_FILE
}

# Write Brewfile
def "pk write" [] {
    brew bundle dump --force
}

# Install package
def "pk in" [name] {
    brew install $name; pk write
}

# Uninstall package
def "pk un" [name] {
    brew uninstall $name; pk write
}
