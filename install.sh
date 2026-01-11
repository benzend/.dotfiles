#!/usr/bin/env bash

set -e

REPO_URL="https://github.com/benzend/.dotfiles.git"
DOTFILES_DIR="$HOME/.dotfiles"
BACKUP_DIR="$HOME/.dotfiles-backup"

# Define the git wrapper function
function dotfiles {
   /usr/bin/git --git-dir="$DOTFILES_DIR/" --work-tree="$HOME" "$@"
}

echo "Starting dotfiles installation..."

# 1. Add .dotfiles to .gitignore
if [ ! -f "$HOME/.gitignore" ]; then
    touch "$HOME/.gitignore"
fi

if ! grep -q ".dotfiles" "$HOME/.gitignore"; then
    echo ".dotfiles" >> "$HOME/.gitignore"
    echo "Added .dotfiles to ~/.gitignore"
fi

# 2. Clone the repository
if [ -d "$DOTFILES_DIR" ]; then
    echo "Dotfiles directory $DOTFILES_DIR already exists. Skipping clone."
else
    echo "Cloning dotfiles from $REPO_URL..."
    git clone --bare "$REPO_URL" "$DOTFILES_DIR"
fi

# 3. Checkout dotfiles
echo "Checking out dotfiles..."
if dotfiles checkout; then
    echo "Checked out dotfiles."
else
    echo "Checkout failed. Backing up pre-existing dotfiles to $BACKUP_DIR..."
    mkdir -p "$BACKUP_DIR"
    
    # Get the list of conflicting files from the error message
    # We capture the output, look for lines indented with whitespace, and iterate
    # This assumes the standard git error message format
    dotfiles checkout 2>&1 | grep -E "^\s+" | sed 's/^[[:space:]]*//' | while read -r file; do
        target="$HOME/$file"
        backup="$BACKUP_DIR/$file"
        
        if [ -e "$target" ]; then
            echo "Backing up $file..."
            mkdir -p "$(dirname "$backup")"
            mv "$target" "$backup"
        fi
    done
    
    echo "Retrying checkout..."
    dotfiles checkout
fi

# 4. Configure git to hide untracked files
dotfiles config --local status.showUntrackedFiles no

echo "Dotfiles installed successfully."
echo ""
echo "Items have been backed up to $BACKUP_DIR if there were conflicts."
echo ""
echo "To manage your dotfiles, you can add this alias to your shell config:"
echo "alias dotfiles='/usr/bin/git --git-dir=\$HOME/.dotfiles/ --work-tree=\$HOME'"
