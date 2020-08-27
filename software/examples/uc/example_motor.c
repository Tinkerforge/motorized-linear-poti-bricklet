#include "bindings/hal_common.h"
#include "bindings/bricklet_motorized_linear_poti.h"

#define UID "XYZ" // Change XYZ to the UID of your Motorized Linear Poti Bricklet

void check(int rc, const char* msg);

void example_setup(TF_HalContext *hal);
void example_loop(TF_HalContext *hal);


// Callback function for position reached callback
static void position_reached_handler(TF_MotorizedLinearPoti *device, uint16_t position,
                                     void *user_data) {
	(void)device; (void)user_data; // avoid unused parameter warning

	tf_hal_printf("Position: %u\n", position); // Range: 0 to 100
}

static TF_MotorizedLinearPoti mlp;

void example_setup(TF_HalContext *hal) {
	// Create device object
	check(tf_motorized_linear_poti_create(&mlp, UID, hal), "create device object");

	// Register position reached callback to function position_reached_handler
	tf_motorized_linear_poti_register_position_reached_callback(&mlp,
	                                                            position_reached_handler,
	                                                            NULL);

	// Move slider smooth to the middle
	check(tf_motorized_linear_poti_set_motor_position(&mlp, 50,
	                                                  TF_MOTORIZED_LINEAR_POTI_DRIVE_MODE_SMOOTH,
	                                                  false), "call set_motor_position");
}

void example_loop(TF_HalContext *hal) {
	// Poll for callbacks
	tf_hal_callback_tick(hal, 0);
}
