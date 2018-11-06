use std::{error::Error, io};

use tinkerforge::{ipconnection::IpConnection, motorized_linear_poti_bricklet::*};

const HOST: &str = "127.0.0.1";
const PORT: u16 = 4223;
const UID: &str = "XYZ"; // Change XYZ to the UID of your Motorized Linear Poti Bricklet

fn main() -> Result<(), Box<dyn Error>> {
    let ipcon = IpConnection::new(); // Create IP connection
    let motorized_linear_poti_bricklet = MotorizedLinearPotiBricklet::new(UID, &ipcon); // Create device object

    ipcon.connect(HOST, PORT).recv()??; // Connect to brickd
                                        // Don't use device before ipcon is connected

    // Get current position
    let position = motorized_linear_poti_bricklet.get_position().recv()?;
    println!("Position: {}", position); // Range: 0 to 100

    println!("Press enter to exit.");
    let mut _input = String::new();
    io::stdin().read_line(&mut _input)?;
    ipcon.disconnect();
    Ok(())
}
