#!/bin/bash

# Get a list of existing LF windows
windows=$(wmctrl -lx | grep -i "scrapbook" | awk '{print $1}')

# Check if any LF window exists
if [ -n "$windows" ]; then
    # Focus the existing LF window
    wmctrl -s 2
    wmctrl -ia "$windows"
    echo "Window found and focused."
else
    echo "No window found."
    wmctrl -s 2
    qterminal -e nvim ~/.scrapbook.txt -name "scrapbook" &
fi
