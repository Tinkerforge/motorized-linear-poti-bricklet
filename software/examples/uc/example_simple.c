#include "bindings/hal_common.h"
#include "bindings/bricklet_motorized_linear_poti.h"

#define UID "XYZ" // Change XYZ to the UID of your Motorized Linear Poti Bricklet

void check(int rc, const char* msg);

void example_setup(TF_HalContext *hal);
void example_loop(TF_HalContext *hal);


static TF_MotorizedLinearPoti mlp;

void example_setup(TF_HalContext *hal) {
	// Create device object
	check(tf_motorized_linear_poti_create(&mlp, UID, hal), "create device object");

	// Get current position
	uint16_t position;
	check(tf_motorized_linear_poti_get_position(&mlp, &position), "get position");

	tf_hal_printf("Position: %I16u\n", position); // Range: 0 to 100
}

void example_loop(TF_HalContext *hal) {
	// Poll for callbacks
	tf_hal_callback_tick(hal, 0);
}
