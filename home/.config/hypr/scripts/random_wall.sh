#!/bin/bash

SCRIPT_DIR=$(cd $(dirname "$0"); pwd)

WALLPAPER_DIR="${SCRIPT_DIR}/../wallpapers"

if ! pgrep -x "awww-daemon" > /dev/null; then
    awww-daemon &
    sleep 0.5
fi

mapfile -t PICS < <(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" -o -name "*.gif" \))

if [ ${#PICS[@]} -eq 0 ]; then
    echo "No images found in $WALLPAPER_DIR"
    exit 1
fi

RANDOM_PIC=${PICS[RANDOM % ${#PICS[@]}]}

awww img "$RANDOM_PIC" --transition-type grow --transition-duration 2
