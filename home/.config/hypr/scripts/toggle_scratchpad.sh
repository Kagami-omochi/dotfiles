#!/bin/bash

WINDOW_INFO=$(hyprctl activewindow -j)

WORKSPACE_NAME=$(echo "$WINDOW_INFO" | jq -r '.workspace.name')

ACTIVE_WORKSPACE=$(hyprctl monitors -j | jq -r '.[] | select(.focused==true) | .activeWorkspace.id')

if [[ "$WORKSPACE_NAME" == special* ]]; then
    hyprctl dispatch movetoworkspace "$ACTIVE_WORKSPACE"
else
    hyprctl dispatch movetoworkspacesilent special
fi