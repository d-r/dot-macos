# List recipes
default:
    @just --list --unsorted

# Install/update packages in Brewfile
in:
    brew bundle install --cleanup

# Update Brewfile
up:
    brew bundle dump --force
    git diff Brewfile

# Link dotfiles
link:
    ./link

# Apply system defaults
apply:
    ./apply-defaults
