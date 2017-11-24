function octave_example_callback()
    more off;

    HOST = "localhost";
    PORT = 4223;
    UID = "XYZ"; % Change XYZ to the UID of your Motorized Linear Poti Bricklet

    ipcon = javaObject("com.tinkerforge.IPConnection"); % Create IP connection
    mlp = javaObject("com.tinkerforge.BrickletMotorizedLinearPoti", UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Register position callback to function cb_position
    mlp.addPositionCallback(@cb_position);

    % Set period for position callback to 0.05s (50ms) without a threshold
    mlp.setPositionCallbackConfiguration(50, false, "x", 0, 0);

    input("Press key to exit\n", "s");
    ipcon.disconnect();
end

% Callback function for position callback (parameter has range 0 to 100)
function cb_position(e)
    fprintf("Position: %d\n", e.position);
end
