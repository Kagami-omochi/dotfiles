#!/bin/bash

set -e

PACKAGES_FILE="packages.txt"

# Check for the existence of packages.txt
if [ ! -f "$PACKAGES_FILE" ]; then
    echo "Error: $PACKAGES_FILE not found."
    exit 1
fi

# Check if paru is installed.
if ! command -v paru &> /dev/null; then
    echo "paru not found. Starting installation..."
    
    sudo pacman -Syu --needed --noconfirm base-devel git
    BUILD_DIR=$(mktemp -d)
    trap 'rm -rf "$BUILD_DIR"' EXIT

    git clone https://aur.archlinux.org/paru.git "$BUILD_DIR/paru"
    (
        cd "$BUILD_DIR/paru"
        makepkg -si --noconfirm
    )
    
    echo "The installation of paru is complete."
else
    echo "Paru is already installed. Continue..."
fi

# Load packages from packages.txt and install them
echo "Install packages from packages.txt..."

grep -Ev '^\s*($|#)' "$PACKAGES_FILE" | xargs -r paru -S --needed --noconfirm

echo "Installation complete!"
