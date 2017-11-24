#!/bin/sh
# Connects to localhost:4223 by default, use --host and --port to change this

uid=XYZ # Change XYZ to the UID of your Motorized Linear Poti Bricklet

# Handle incoming position callbacks (parameter has range 0 to 100)
tinkerforge dispatch motorized-linear-poti-bricklet $uid position &

# Set period for position callback to 0.05s (50ms) without a threshold
tinkerforge call motorized-linear-poti-bricklet $uid set-position-callback-configuration 50 false threshold-option-off 0 0

echo "Press key to exit"; read dummy

kill -- -$$ # Stop callback dispatch in background
