package main

import (
	"fmt"
	"github.com/Tinkerforge/go-api-bindings/ipconnection"
	"github.com/Tinkerforge/go-api-bindings/motorized_linear_poti_bricklet"
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

	// Get current position.
	position, _ := mlp.GetPosition()
	fmt.Printf("Position: \n", position) // Range: 0 to 100

	fmt.Print("Press enter to exit.")
	fmt.Scanln()
}
