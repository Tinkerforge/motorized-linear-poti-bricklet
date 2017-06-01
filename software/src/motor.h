/* motorized-linear-poti-bricklet
 * Copyright (C) 2017 Olaf Lüke <olaf@tinkerforge.com>
 *
 * motor.h: Motor driver
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 */

#ifndef MOTOR_H
#define MOTOR_H

#include <stdint.h>
#include <stdbool.h>

#define MOTOR_CALIBRATION_GAIN_MULTIPLIER 100000

typedef enum {
	CALIBRATION_STATE_OFF,
	CALIBRATION_STATE_START,
	CALIBRATION_STATE_START_DRIVE_TO_MIN,
	CALIBRATION_STATE_SAVE_VALUE_MIN,
	CALIBRATION_STATE_START_DRIVE_TO_MAX,
	CALIBRATION_STATE_SAVE_VALUE_MAX,
	CALIBRATION_STATE_SAVE_CALIBRATION,
} MotorCalibrationState;

typedef struct {
	uint16_t position;
	uint8_t drive_mode;
	bool hold_position;
	uint32_t hold_position_time;

	bool position_reached;
	bool position_reached_callback_send;
	bool position_reached_callback_enabled;

	MotorCalibrationState calibration_state;
	uint32_t calibration_time;

	uint32_t calibration_poti_value_max;
	uint32_t calibration_poti_value_min;
	uint32_t calibration_gain;
	uint32_t calibration_offset;
} Motor;

void motor_new_position(Motor *motor);
void motor_calibrate_init(Motor *motor);
void motor_calibrate_tick(Motor *motor);
void motor_init(Motor *motor);
void motor_tick(Motor *motor);

#endif
