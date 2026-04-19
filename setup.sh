#!/bin/bash

PACKAGE_LIST="packages.txt"

if ! command -v yay &> /dev/null; then
    echo "Error: yay is not installed. Please install yay first."
    exit 1
fi

if [ ! -f "$PACKAGE_LIST" ]; then
    echo "Error: $PACKAGE_LIST not found."
    exit 1
fi

echo "Starting package installation..."

grep -vE '^\s*#|^\s*$' "$PACKAGE_LIST" | xargs -r yay -S --needed --noconfirm

echo "Installation complete!"
```
