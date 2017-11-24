using System;
using Tinkerforge;

class Example
{
	private static string HOST = "localhost";
	private static int PORT = 4223;
	private static string UID = "XYZ"; // Change XYZ to the UID of your Motorized Linear Poti Bricklet

	// Callback function for position callback (parameter has range 0 to 100)
	static void PositionCB(BrickletMotorizedLinearPoti sender, int position)
	{
		Console.WriteLine("Position: " + position);
	}

	static void Main()
	{
		IPConnection ipcon = new IPConnection(); // Create IP connection
		BrickletMotorizedLinearPoti mlp =
		  new BrickletMotorizedLinearPoti(UID, ipcon); // Create device object

		ipcon.Connect(HOST, PORT); // Connect to brickd
		// Don't use device before ipcon is connected

		// Register position callback to function PositionCB
		mlp.PositionCallback += PositionCB;

		// Set period for position callback to 0.05s (50ms) without a threshold
		mlp.SetPositionCallbackConfiguration(50, false, 'x', 0, 0);

		Console.WriteLine("Press enter to exit");
		Console.ReadLine();
		ipcon.Disconnect();
	}
}
