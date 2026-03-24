#!/bin/bash

# Get a list of existing LF windows
lf_windows=$(wmctrl -lx | grep -i "lf.qterminal" | awk '{print $1}')

# Check if any LF window exists
if [ -n "$lf_windows" ]; then
    # Focus the existing LF window
    wmctrl -ia "$lf_windows"
    echo "Window found and focused."
else
    echo "No LF window found."
    qterminal -e lf -name "lf" &
fi
