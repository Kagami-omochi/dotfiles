#!/bin/bash

ADDRS=$(hyprctl clients -j | jq -r '.[].address')

if hyprctl plugin list | grep -q "hyprbars"; then
    hyprpm disable hyprbars
    
    BATCH=$(echo "$ADDRS" | sed 's/.*/dispatch settiled address:&;/' | tr -d '\n')
    hyprctl --batch "$BATCH"

    hyprctl keyword windowrule "match:class .*, float off"
    hyprctl keyword general:resize_on_border false
else
    hyprpm enable hyprbars
    
    BATCH=$(echo "$ADDRS" | sed 's/.*/dispatch setfloating address:&;/' | tr -d '\n')
    hyprctl --batch "$BATCH"

    hyprctl keyword windowrule "match:class .*, float on"
    hyprctl keyword general:resize_on_border true
fi
