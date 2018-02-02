<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickletMotorizedLinearPoti.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickletMotorizedLinearPoti;

const HOST = 'localhost';
const PORT = 4223;
const UID = 'XYZ'; // Change XYZ to the UID of your Motorized Linear Poti Bricklet

// Callback function for position reached callback
function cb_positionReached($position)
{
    echo "Position: $position\n"; // Range: 0 to 100
}

$ipcon = new IPConnection(); // Create IP connection
$mlp = new BrickletMotorizedLinearPoti(UID, $ipcon); // Create device object

$ipcon->connect(HOST, PORT); // Connect to brickd
// Don't use device before ipcon is connected

// Register position reached callback to function cb_positionReached
$mlp->registerCallback(BrickletMotorizedLinearPoti::CALLBACK_POSITION_REACHED,
                       'cb_positionReached');

// Move slider smooth to the middle
$mlp->setMotorPosition(50, BrickletMotorizedLinearPoti::DRIVE_MODE_SMOOTH, FALSE);

echo "Press ctrl+c to exit\n";
$ipcon->dispatchCallbacks(-1); // Dispatch callbacks forever

?>
