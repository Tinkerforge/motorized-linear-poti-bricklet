import com.tinkerforge.IPConnection;
import com.tinkerforge.BrickletMotorizedLinearPoti;

public class ExampleCallback {
	private static final String HOST = "localhost";
	private static final int PORT = 4223;

	// Change XYZ to the UID of your Motorized Linear Poti Bricklet
	private static final String UID = "XYZ";

	// Note: To make the example code cleaner we do not handle exceptions. Exceptions
	//       you might normally want to catch are described in the documentation
	public static void main(String args[]) throws Exception {
		IPConnection ipcon = new IPConnection(); // Create IP connection
		BrickletMotorizedLinearPoti mlp =
		  new BrickletMotorizedLinearPoti(UID, ipcon); // Create device object

		ipcon.connect(HOST, PORT); // Connect to brickd
		// Don't use device before ipcon is connected

		// Add position listener
		mlp.addPositionListener(new BrickletMotorizedLinearPoti.PositionListener() {
			public void position(int position) {
				System.out.println("Position: " + position); // Range: 0 to 100
			}
		});

		// Set period for position callback to 0.05s (50ms) without a threshold
		mlp.setPositionCallbackConfiguration(50, false, 'x', 0, 0);

		System.out.println("Press key to exit"); System.in.read();
		ipcon.disconnect();
	}
}
