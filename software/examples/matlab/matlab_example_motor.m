function matlab_example_motor()
    import com.tinkerforge.IPConnection;
    import com.tinkerforge.BrickletMotorizedLinearPoti;

    HOST = 'localhost';
    PORT = 4223;
    UID = 'XYZ'; % Change XYZ to the UID of your Motorized Linear Poti Bricklet

    ipcon = IPConnection(); % Create IP connection
    mlp = handle(BrickletMotorizedLinearPoti(UID, ipcon), 'CallbackProperties'); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Register position reached callback to function cb_position_reached
    set(mlp, 'PositionReachedCallback', @(h, e) cb_position_reached(e));

    % Move slider smooth to the middle
    mlp.setMotorPosition(50, BrickletMotorizedLinearPoti.DRIVE_MODE_SMOOTH, false);

    input('Press key to exit\n', 's');
    ipcon.disconnect();
end

% Callback function for position reached callback
function cb_position_reached(e)
    fprintf('Position: %i\n', e.position); % Range: 0 to 100
end
