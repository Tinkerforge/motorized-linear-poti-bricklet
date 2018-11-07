use std::{error::Error, io, thread};
use tinkerforge::{ip_connection::IpConnection, motorized_linear_poti_bricklet::*};

const HOST: &str = "localhost";
const PORT: u16 = 4223;
const UID: &str = "XYZ"; // Change XYZ to the UID of your Motorized Linear Poti Bricklet.

fn main() -> Result<(), Box<dyn Error>> {
    let ipcon = IpConnection::new(); // Create IP connection.
    let mlp = MotorizedLinearPotiBricklet::new(UID, &ipcon); // Create device object.

    ipcon.connect((HOST, PORT)).recv()??; // Connect to brickd.
                                          // Don't use device before ipcon is connected.

    // Create receiver for position reached events.
    let position_reached_receiver = mlp.get_position_reached_receiver();

    // Spawn thread to handle received events. This thread ends when the `mlp` object
    // is dropped, so there is no need for manual cleanup.
    thread::spawn(move || {
        for position_reached in position_reached_receiver {
            println!("Position: {}", position_reached); // Range: 0 to 100
        }
    });

    // Move slider smooth to the middle
    mlp.set_motor_position(50, MOTORIZED_LINEAR_POTI_BRICKLET_DRIVE_MODE_SMOOTH, false);

    println!("Press enter to exit.");
    let mut _input = String::new();
    io::stdin().read_line(&mut _input)?;
    ipcon.disconnect();
    Ok(())
}
