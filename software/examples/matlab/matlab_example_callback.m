function matlab_example_callback()
    import com.tinkerforge.IPConnection;
    import com.tinkerforge.BrickletMotorizedLinearPoti;

    HOST = 'localhost';
    PORT = 4223;
    UID = 'XYZ'; % Change XYZ to the UID of your Motorized Linear Poti Bricklet

    ipcon = IPConnection(); % Create IP connection
    mlp = handle(BrickletMotorizedLinearPoti(UID, ipcon), 'CallbackProperties'); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Register position callback to function cb_position
    set(mlp, 'PositionCallback', @(h, e) cb_position(e));

    % Set period for position callback to 0.05s (50ms) without a threshold
    mlp.setPositionCallbackConfiguration(50, false, 'x', 0, 0);

    input('Press key to exit\n', 's');
    ipcon.disconnect();
end

% Callback function for position callback
function cb_position(e)
    fprintf('Position: %i\n', e.position); % Range: 0 to 100
end
