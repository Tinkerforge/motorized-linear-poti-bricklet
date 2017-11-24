function matlab_example_simple()
    import com.tinkerforge.IPConnection;
    import com.tinkerforge.BrickletMotorizedLinearPoti;

    HOST = 'localhost';
    PORT = 4223;
    UID = 'XYZ'; % Change XYZ to the UID of your Motorized Linear Poti Bricklet

    ipcon = IPConnection(); % Create IP connection
    mlp = handle(BrickletMotorizedLinearPoti(UID, ipcon), 'CallbackProperties'); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Get current position (range is 0 to 100)
    position = mlp.getPosition();
    fprintf('Position: %i\n', position);

    input('Press key to exit\n', 's');
    ipcon.disconnect();
end
