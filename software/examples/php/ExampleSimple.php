<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickletMotorizedLinearPoti.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickletMotorizedLinearPoti;

const HOST = 'localhost';
const PORT = 4223;
const UID = 'XYZ'; // Change XYZ to the UID of your Motorized Linear Poti Bricklet

$ipcon = new IPConnection(); // Create IP connection
$mlp = new BrickletMotorizedLinearPoti(UID, $ipcon); // Create device object

$ipcon->connect(HOST, PORT); // Connect to brickd
// Don't use device before ipcon is connected

// Get current position (range is 0 to 100)
$position = $mlp->getPosition();
echo "Position: $position\n";

echo "Press key to exit\n";
fgetc(fopen('php://stdin', 'r'));
$ipcon->disconnect();

?>
