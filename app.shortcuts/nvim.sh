#!/bin/bash

# Get a list of existing LF windows
nvim_windows=$(wmctrl -lx | grep -i "nvim.qterminal" | awk '{print $1}')

# Check if any LF window exists
if [ -n "$nvim_windows" ]; then
    # Focus the existing LF window
    wmctrl -s 0
    wmctrl -ia "$nvim_windows"
    echo "Window found and focused."
else
    echo "No nvim window found."
    wmctrl -s 0
    qterminal -e nvim -name "nvim" &
fi
