# List recipes
default:
    @just --list --unsorted

# Install/update Homebrew packages
in:
    brew bundle dump --force
    brew bundle install --cleanup

# Link dotfiles
link:
    ./link

# Apply system defaults
apply:
    ./apply-defaults
