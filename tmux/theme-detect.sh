#!/bin/bash

# Get the current macOS appearance setting
appearance=$(defaults read -g AppleInterfaceStyle 2>/dev/null)

# If AppleInterfaceStyle is "Dark", then dark mode is enabled
# If the key doesn't exist or is empty, then light mode is enabled
if [[ "$appearance" == "Dark" ]]; then
    echo "dark"
else
    echo "light"
fi