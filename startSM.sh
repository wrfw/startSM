#!/bin/bash

# Change to the desired directory
cd ~/Software/ScreenshotMonitor || {
    echo "Error: Failed to change directory to ~/Software/ScreenshotMonitor"
    exit 1
}

# Run the podman command
podman run -it \
  -e DISPLAY="$DISPLAY" \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  localhost/screenshot-monitor
