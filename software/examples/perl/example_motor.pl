#!/usr/bin/perl

use Tinkerforge::IPConnection;
use Tinkerforge::BrickletMotorizedLinearPoti;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => 'XYZ'; # Change XYZ to the UID of your Motorized Linear Poti Bricklet

# Callback subroutine for position reached callback (parameter has range 0 to 100)
sub cb_position_reached
{
    my ($position) = @_;

    print "Position: $position\n";
}

my $ipcon = Tinkerforge::IPConnection->new(); # Create IP connection
my $mlp = Tinkerforge::BrickletMotorizedLinearPoti->new(&UID, $ipcon); # Create device object

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

# Register position reached callback to subroutine cb_position_reached
$mlp->register_callback($mlp->CALLBACK_POSITION_REACHED, 'cb_position_reached');

# Move slider smooth to the middle
$mlp->set_motor_position(50, $mlp->DRIVE_MODE_SMOOTH, 0);

print "Press key to exit\n";
<STDIN>;
$ipcon->disconnect();
