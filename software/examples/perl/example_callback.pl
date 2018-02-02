#!/usr/bin/perl

use Tinkerforge::IPConnection;
use Tinkerforge::BrickletMotorizedLinearPoti;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => 'XYZ'; # Change XYZ to the UID of your Motorized Linear Poti Bricklet

# Callback subroutine for position callback
sub cb_position
{
    my ($position) = @_;

    print "Position: $position\n"; # Range: 0 to 100
}

my $ipcon = Tinkerforge::IPConnection->new(); # Create IP connection
my $mlp = Tinkerforge::BrickletMotorizedLinearPoti->new(&UID, $ipcon); # Create device object

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

# Register position callback to subroutine cb_position
$mlp->register_callback($mlp->CALLBACK_POSITION, 'cb_position');

# Set period for position callback to 0.05s (50ms) without a threshold
$mlp->set_position_callback_configuration(50, 0, 'x', 0, 0);

print "Press key to exit\n";
<STDIN>;
$ipcon->disconnect();
