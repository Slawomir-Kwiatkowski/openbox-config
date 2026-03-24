#!/bin/bash

APP_NAME="code-oss"  
EXECUTABLE="code-oss"     

# Check if app is running
PID=$(pgrep -x "$APP_NAME")

if [ -n "$PID" ]; then
    echo "$APP_NAME is already running. Focusing the window..."
    # Find window ID
    WINDOW_ID=$(wmctrl -lp | grep "$PID" | head -n 1 | awk '{print $1}')
    if [ -n "$WINDOW_ID" ]; then
        wmctrl -ia "$WINDOW_ID"
    else
        echo "Window not found."
    fi
else
    echo "Starting $APP_NAME..."
    $EXECUTABLE &
fi
