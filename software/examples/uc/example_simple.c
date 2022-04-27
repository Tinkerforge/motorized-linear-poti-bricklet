// This example is not self-contained.
// It requires usage of the example driver specific to your platform.
// See the HAL documentation.

#include "src/bindings/hal_common.h"
#include "src/bindings/bricklet_motorized_linear_poti.h"

void check(int rc, const char *msg);
void example_setup(TF_HAL *hal);
void example_loop(TF_HAL *hal);

static TF_MotorizedLinearPoti mlp;

void example_setup(TF_HAL *hal) {
	// Create device object
	check(tf_motorized_linear_poti_create(&mlp, NULL, hal), "create device object");

	// Get current position
	uint16_t position;
	check(tf_motorized_linear_poti_get_position(&mlp, &position), "get position");

	tf_hal_printf("Position: %I16u\n", position); // Range: 0 to 100
}

void example_loop(TF_HAL *hal) {
	// Poll for callbacks
	tf_hal_callback_tick(hal, 0);
}
