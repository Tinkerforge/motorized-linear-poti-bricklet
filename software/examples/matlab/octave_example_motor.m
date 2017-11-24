function octave_example_motor()
    more off;

    HOST = "localhost";
    PORT = 4223;
    UID = "XYZ"; % Change XYZ to the UID of your Motorized Linear Poti Bricklet

    ipcon = javaObject("com.tinkerforge.IPConnection"); % Create IP connection
    mlp = javaObject("com.tinkerforge.BrickletMotorizedLinearPoti", UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Register position reached callback to function cb_position_reached
    mlp.addPositionReachedCallback(@cb_position_reached);

    % Move slider smooth to the middle
    mlp.setMotorPosition(50, mlp.DRIVE_MODE_SMOOTH, false);

    input("Press key to exit\n", "s");
    ipcon.disconnect();
end

% Callback function for position reached callback (parameter has range 0 to 100)
function cb_position_reached(e)
    fprintf("Position: %d\n", e.position);
end
