import com.tinkerforge.IPConnection;
import com.tinkerforge.BrickletMotorizedLinearPoti;

public class ExampleMotor {
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

		// Add position reached listener
		mlp.addPositionReachedListener(new BrickletMotorizedLinearPoti.PositionReachedListener() {
			public void positionReached(int position) {
				System.out.println("Position: " + position); // Range: 0 to 100
			}
		});

		// Move slider smooth to the middle
		mlp.setMotorPosition(50, BrickletMotorizedLinearPoti.DRIVE_MODE_SMOOTH, false);

		System.out.println("Press key to exit"); System.in.read();
		ipcon.disconnect();
	}
}
