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

	mlp.RegisterPositionCallback(func(position uint16) {
		fmt.Printf("Position: %d\n", position) // Range: 0 to 100
	})

	// Set period for position callback to 0.05s (50ms) without a threshold.
	mlp.SetPositionCallbackConfiguration(50, false, 'x', 0, 0)

	fmt.Print("Press enter to exit.")
	fmt.Scanln()
}
