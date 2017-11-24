function octave_example_simple()
    more off;

    HOST = "localhost";
    PORT = 4223;
    UID = "XYZ"; % Change XYZ to the UID of your Motorized Linear Poti Bricklet

    ipcon = javaObject("com.tinkerforge.IPConnection"); % Create IP connection
    mlp = javaObject("com.tinkerforge.BrickletMotorizedLinearPoti", UID, ipcon); % Create device object

    ipcon.connect(HOST, PORT); % Connect to brickd
    % Don't use device before ipcon is connected

    % Get current position (range is 0 to 100)
    position = mlp.getPosition();
    fprintf("Position: %d\n", position);

    input("Press key to exit\n", "s");
    ipcon.disconnect();
end
