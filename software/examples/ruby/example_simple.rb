#!/usr/bin/env ruby
# -*- ruby encoding: utf-8 -*-

require 'tinkerforge/ip_connection'
require 'tinkerforge/bricklet_motorized_linear_poti'

include Tinkerforge

HOST = 'localhost'
PORT = 4223
UID = 'XYZ' # Change XYZ to the UID of your Motorized Linear Poti Bricklet

ipcon = IPConnection.new # Create IP connection
mlp = BrickletMotorizedLinearPoti.new UID, ipcon # Create device object

ipcon.connect HOST, PORT # Connect to brickd
# Don't use device before ipcon is connected

# Get current position (range is 0 to 100)
position = mlp.get_position
puts "Position: #{position}"

puts 'Press key to exit'
$stdin.gets
ipcon.disconnect
