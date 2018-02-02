#!/usr/bin/env python
# -*- coding: utf-8 -*-

HOST = "localhost"
PORT = 4223
UID = "XYZ" # Change XYZ to the UID of your Motorized Linear Poti Bricklet

from tinkerforge.ip_connection import IPConnection
from tinkerforge.bricklet_motorized_linear_poti import BrickletMotorizedLinearPoti

# Callback function for position reached callback
def cb_position_reached(position):
    print("Position: " + str(position)) # Range: 0 to 100

if __name__ == "__main__":
    ipcon = IPConnection() # Create IP connection
    mlp = BrickletMotorizedLinearPoti(UID, ipcon) # Create device object

    ipcon.connect(HOST, PORT) # Connect to brickd
    # Don't use device before ipcon is connected

    # Register position reached callback to function cb_position_reached
    mlp.register_callback(mlp.CALLBACK_POSITION_REACHED, cb_position_reached)

    # Move slider smooth to the middle
    mlp.set_motor_position(50, mlp.DRIVE_MODE_SMOOTH, False)

    raw_input("Press key to exit\n") # Use input() in Python 3
    ipcon.disconnect()
