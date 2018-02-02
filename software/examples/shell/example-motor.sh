#!/bin/sh
# Connects to localhost:4223 by default, use --host and --port to change this

uid=XYZ # Change XYZ to the UID of your Motorized Linear Poti Bricklet

# Handle incoming position reached callbacks
tinkerforge dispatch motorized-linear-poti-bricklet $uid position-reached &

# Move slider smooth to the middle
tinkerforge call motorized-linear-poti-bricklet $uid set-motor-position 50 drive-mode-smooth false

echo "Press key to exit"; read dummy

kill -- -$$ # Stop callback dispatch in background
