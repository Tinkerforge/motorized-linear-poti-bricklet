<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickletMotorizedLinearPoti.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickletMotorizedLinearPoti;

const HOST = 'localhost';
const PORT = 4223;
const UID = 'XYZ'; // Change XYZ to the UID of your Motorized Linear Poti Bricklet

// Callback function for position callback (parameter has range 0 to 100)
function cb_position($position)
{
    echo "Position: $position\n";
}

$ipcon = new IPConnection(); // Create IP connection
$mlp = new BrickletMotorizedLinearPoti(UID, $ipcon); // Create device object

$ipcon->connect(HOST, PORT); // Connect to brickd
// Don't use device before ipcon is connected

// Register position callback to function cb_position
$mlp->registerCallback(BrickletMotorizedLinearPoti::CALLBACK_POSITION, 'cb_position');

// Set period for position callback to 0.05s (50ms) without a threshold
$mlp->setPositionCallbackConfiguration(50, FALSE, 'x', 0, 0);

echo "Press ctrl+c to exit\n";
$ipcon->dispatchCallbacks(-1); // Dispatch callbacks forever

?>
