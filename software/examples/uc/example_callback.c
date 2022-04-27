// This example is not self-contained.
// It requires usage of the example driver specific to your platform.
// See the HAL documentation.

#include "src/bindings/hal_common.h"
#include "src/bindings/bricklet_motorized_linear_poti.h"

void check(int rc, const char *msg);
void example_setup(TF_HAL *hal);
void example_loop(TF_HAL *hal);

// Callback function for position callback
static void position_handler(TF_MotorizedLinearPoti *device, uint16_t position,
                             void *user_data) {
	(void)device; (void)user_data; // avoid unused parameter warning

	tf_hal_printf("Position: %I16u\n", position); // Range: 0 to 100
}

static TF_MotorizedLinearPoti mlp;

void example_setup(TF_HAL *hal) {
	// Create device object
	check(tf_motorized_linear_poti_create(&mlp, NULL, hal), "create device object");

	// Register position callback to function position_handler
	tf_motorized_linear_poti_register_position_callback(&mlp,
	                                                    position_handler,
	                                                    NULL);

	// Set period for position callback to 0.05s (50ms) without a threshold
	tf_motorized_linear_poti_set_position_callback_configuration(&mlp, 50, false, 'x', 0, 0);
}

void example_loop(TF_HAL *hal) {
	// Poll for callbacks
	tf_hal_callback_tick(hal, 0);
}
