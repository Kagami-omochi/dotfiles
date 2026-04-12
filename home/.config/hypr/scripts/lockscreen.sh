#!/bin/bash

CURRENT_WS=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .activeWorkspace.id')
hyprctl dispatch togglespecialworkspace lock-space
sleep 0.3
hyprlock
hyprctl dispatch togglespecialworkspace lock-space
hyprctl dispatch workspace "$CURRENT_WS"
