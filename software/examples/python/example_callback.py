#!/usr/bin/env python
# -*- coding: utf-8 -*-

HOST = "localhost"
PORT = 4223
UID = "XYZ" # Change XYZ to the UID of your Motorized Linear Poti Bricklet

from tinkerforge.ip_connection import IPConnection
from tinkerforge.bricklet_motorized_linear_poti import BrickletMotorizedLinearPoti

# Callback function for position callback
def cb_position(position):
    print("Position: " + str(position)) # Range: 0 to 100

if __name__ == "__main__":
    ipcon = IPConnection() # Create IP connection
    mlp = BrickletMotorizedLinearPoti(UID, ipcon) # Create device object

    ipcon.connect(HOST, PORT) # Connect to brickd
    # Don't use device before ipcon is connected

    # Register position callback to function cb_position
    mlp.register_callback(mlp.CALLBACK_POSITION, cb_position)

    # Set period for position callback to 0.05s (50ms) without a threshold
    mlp.set_position_callback_configuration(50, False, "x", 0, 0)

    raw_input("Press key to exit\n") # Use input() in Python 3
    ipcon.disconnect()
