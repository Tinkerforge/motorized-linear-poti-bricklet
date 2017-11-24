#!/usr/bin/perl

use Tinkerforge::IPConnection;
use Tinkerforge::BrickletMotorizedLinearPoti;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => 'XYZ'; # Change XYZ to the UID of your Motorized Linear Poti Bricklet

my $ipcon = Tinkerforge::IPConnection->new(); # Create IP connection
my $mlp = Tinkerforge::BrickletMotorizedLinearPoti->new(&UID, $ipcon); # Create device object

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

# Get current position (range is 0 to 100)
my $position = $mlp->get_position();
print "Position: $position\n";

print "Press key to exit\n";
<STDIN>;
$ipcon->disconnect();
