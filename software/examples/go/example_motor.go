package main

import (
	"fmt"
	"tinkerforge/ipconnection"
	"tinkerforge/motorized_linear_poti_bricklet"
)

const ADDR string = "localhost:4223"
const UID string = "XYZ" // Change XYZ to the UID of your Motorized Linear Poti Bricklet.

func main() {
	ipcon := ipconnection.New()
	defer ipcon.Close()
	mlp, _ := motorized_linear_poti_bricklet.New(UID, &ipcon) // Create device object.

	ipcon.Connect(ADDR) // Connect to brickd.
	defer ipcon.Disconnect()
	// Don't use device before ipcon is connected.

	mlp.RegisterPositionReachedCallback(func(position uint16) {
		fmt.Printf("Position: %d\n", position) // Range: 0 to 100
	})

	// Move slider smooth to the middle
	mlp.SetMotorPosition(50, motorized_linear_poti_bricklet.DriveModeSmooth, false)

	fmt.Print("Press enter to exit.")
	fmt.Scanln()

}
