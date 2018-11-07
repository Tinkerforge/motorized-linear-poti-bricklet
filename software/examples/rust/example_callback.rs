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

    // Create receiver for position events.
    let position_receiver = mlp.get_position_receiver();

    // Spawn thread to handle received events. This thread ends when the `mlp` object
    // is dropped, so there is no need for manual cleanup.
    thread::spawn(move || {
        for position in position_receiver {
            println!("Position: {}", position); // Range: 0 to 100
        }
    });

    // Set period for position callback to 0.05s (50ms) without a threshold.
    mlp.set_position_callback_configuration(50, false, 'x', 0, 0);

    println!("Press enter to exit.");
    let mut _input = String::new();
    io::stdin().read_line(&mut _input)?;
    ipcon.disconnect();
    Ok(())
}
