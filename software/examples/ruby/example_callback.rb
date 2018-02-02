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

# Register position callback
mlp.register_callback(BrickletMotorizedLinearPoti::CALLBACK_POSITION) do |position|
  puts "Position: #{position}" # Range: 0 to 100
end

# Set period for position callback to 0.05s (50ms) without a threshold
mlp.set_position_callback_configuration 50, false, 'x', 0, 0

puts 'Press key to exit'
$stdin.gets
ipcon.disconnect
