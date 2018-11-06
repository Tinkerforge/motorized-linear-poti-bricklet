use std::{error::Error, io, thread};
use tinkerforge::{ipconnection::IpConnection, motorized_linear_poti_bricklet::*};

const HOST: &str = "127.0.0.1";
const PORT: u16 = 4223;
const UID: &str = "XYZ"; // Change XYZ to the UID of your Motorized Linear Poti Bricklet

fn main() -> Result<(), Box<dyn Error>> {
    let ipcon = IpConnection::new(); // Create IP connection
    let motorized_linear_poti_bricklet = MotorizedLinearPotiBricklet::new(UID, &ipcon); // Create device object

    ipcon.connect(HOST, PORT).recv()??; // Connect to brickd
                                        // Don't use device before ipcon is connected

    //Create listener for position reached events.
    let position_reached_listener = motorized_linear_poti_bricklet.get_position_reached_receiver();
    // Spawn thread to handle received events. This thread ends when the motorized_linear_poti_bricklet
    // is dropped, so there is no need for manual cleanup.
    thread::spawn(move || {
        for event in position_reached_listener {
            println!("Position: {}", event); // Range: 0 to 100
        }
    });

    // Move slider smooth to the middle
    motorized_linear_poti_bricklet.set_motor_position(50, MOTORIZED_LINEAR_POTI_BRICKLET_DRIVE_MODE_SMOOTH, false);

    println!("Press enter to exit.");
    let mut _input = String::new();
    io::stdin().read_line(&mut _input)?;
    ipcon.disconnect();
    Ok(())
}
