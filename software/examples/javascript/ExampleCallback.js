var Tinkerforge = require('tinkerforge');

var HOST = 'localhost';
var PORT = 4223;
var UID = 'XYZ'; // Change XYZ to the UID of your Motorized Linear Poti Bricklet

var ipcon = new Tinkerforge.IPConnection(); // Create IP connection
var mlp = new Tinkerforge.BrickletMotorizedLinearPoti(UID, ipcon); // Create device object

ipcon.connect(HOST, PORT,
    function (error) {
        console.log('Error: ' + error);
    }
); // Connect to brickd
// Don't use device before ipcon is connected

ipcon.on(Tinkerforge.IPConnection.CALLBACK_CONNECTED,
    function (connectReason) {
        // Set period for position callback to 0.05s (50ms) without a threshold
        mlp.setPositionCallbackConfiguration(50, false, 'x', 0, 0);
    }
);

// Register position callback
mlp.on(Tinkerforge.BrickletMotorizedLinearPoti.CALLBACK_POSITION,
    // Callback function for position callback (parameter has range 0 to 100)
    function (position) {
        console.log('Position: ' + position);
    }
);

console.log('Press key to exit');
process.stdin.on('data',
    function (data) {
        ipcon.disconnect();
        process.exit(0);
    }
);
