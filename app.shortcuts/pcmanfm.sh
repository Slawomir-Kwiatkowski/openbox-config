#!/bin/bash

APP_NAME="pcmanfm-qt"

# Find all windows belonging to pcmanfm-qt
windows=$(xdotool search --class "$APP_NAME")

# Loop through windows to find one that does NOT have WM_NAME="pcmanfm-desktop0"
target_window=""
for win in $windows; do
    wm_name=$(xdotool getwindowname "$win")
    if [ "$wm_name" != "pcmanfm-desktop0" ]; then
        target_window="$win"
        break
    fi
done

if [ -z "$target_window" ]; then
    echo "No suitable window found that is not 'pcmanfm-desktop0'."
    $APP_NAME & 
fi

# Activate the selected window
xdotool windowactivate "$target_window"
