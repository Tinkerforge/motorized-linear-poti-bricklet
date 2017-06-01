/* motorized-linear-poti-bricklet
 * Copyright (C) 2017 Olaf Lüke <olaf@tinkerforge.com>
 *
 * motor.c: Motor driver
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

#include "motor.h"

#include "configs/config_motor.h"
#include "configs/config_poti.h"

#include "bricklib2/utility/util_definitions.h"
#include "bricklib2/hal/ccu4_pwm/ccu4_pwm.h"
#include "bricklib2/hal/system_timer/system_timer.h"
#include "bricklib2/bootloader/bootloader.h"

#include "communication.h"
#include "poti.h"

extern uint32_t poti_adc_value_sum;
extern uint32_t poti_adc_value_num;

#define MOTOR_CALIBRATION_WAIT 1000
#define MOTOR_POTI_VALUE_WAIT 100

void motor_calibrate_init(Motor *motor) {
	motor->calibration_state = CALIBRATION_STATE_START;
}

void motor_calibrate_tick(Motor *motor) {
	switch(motor->calibration_state) {
		case CALIBRATION_STATE_START: {
			ccu4_pwm_set_duty_cycle(MOTOR_REVERSE_CCU4_SLICE, 0);
			ccu4_pwm_set_duty_cycle(MOTOR_FORWARD_CCU4_SLICE, 1000);

			motor->calibration_time = system_timer_get_ms();
			motor->calibration_state = CALIBRATION_STATE_START_DRIVE_TO_MIN;

			break;
		}

		case CALIBRATION_STATE_START_DRIVE_TO_MIN: {
			if(system_timer_is_time_elapsed_ms(motor->calibration_time, MOTOR_CALIBRATION_WAIT)) {
				NVIC_DisableIRQ(POTI_ADC_IRQ);
				poti_adc_value_sum = 0;
				poti_adc_value_num = 0;
				NVIC_EnableIRQ(POTI_ADC_IRQ);

				motor->calibration_time = system_timer_get_ms();
				motor->calibration_state = CALIBRATION_STATE_SAVE_VALUE_MIN;
			}

			break;
		}

		case CALIBRATION_STATE_SAVE_VALUE_MIN: {
			if(system_timer_is_time_elapsed_ms(motor->calibration_time, MOTOR_POTI_VALUE_WAIT)) {
				NVIC_DisableIRQ(POTI_ADC_IRQ);
				motor->calibration_poti_value_min = (poti_adc_value_sum + poti_adc_value_num/2)/poti_adc_value_num;
				NVIC_EnableIRQ(POTI_ADC_IRQ);
				ccu4_pwm_set_duty_cycle(MOTOR_REVERSE_CCU4_SLICE, 1000);
				ccu4_pwm_set_duty_cycle(MOTOR_FORWARD_CCU4_SLICE, 0);

				motor->calibration_time = system_timer_get_ms();
				motor->calibration_state = CALIBRATION_STATE_START_DRIVE_TO_MAX;
			}

			break;
		}

		case CALIBRATION_STATE_START_DRIVE_TO_MAX: {
			if(system_timer_is_time_elapsed_ms(motor->calibration_time, MOTOR_CALIBRATION_WAIT)) {
				NVIC_DisableIRQ(POTI_ADC_IRQ);
				poti_adc_value_sum = 0;
				poti_adc_value_num = 0;
				NVIC_EnableIRQ(POTI_ADC_IRQ);

				motor->calibration_time = system_timer_get_ms();
				motor->calibration_state = CALIBRATION_STATE_SAVE_VALUE_MAX;
			}

			break;
		}

		case CALIBRATION_STATE_SAVE_VALUE_MAX: {
			if(system_timer_is_time_elapsed_ms(motor->calibration_time, MOTOR_POTI_VALUE_WAIT)) {
				NVIC_DisableIRQ(POTI_ADC_IRQ);
				motor->calibration_poti_value_max = (poti_adc_value_sum + poti_adc_value_num/2)/poti_adc_value_num;
				NVIC_EnableIRQ(POTI_ADC_IRQ);
				ccu4_pwm_set_duty_cycle(MOTOR_REVERSE_CCU4_SLICE, 0);
				ccu4_pwm_set_duty_cycle(MOTOR_FORWARD_CCU4_SLICE, 0);

				motor->calibration_time = system_timer_get_ms();
				motor->calibration_state = CALIBRATION_STATE_SAVE_CALIBRATION;
			}

			break;
		}

		case CALIBRATION_STATE_SAVE_CALIBRATION: {
			motor->calibration_offset = motor->calibration_poti_value_min;
			motor->calibration_gain   = (4095*4*MOTOR_CALIBRATION_GAIN_MULTIPLIER)/(motor->calibration_poti_value_max - motor->calibration_offset);
			motor->calibration_state  = CALIBRATION_STATE_OFF;


			uint32_t page[EEPROM_PAGE_SIZE/sizeof(uint32_t)];
			page[MOTOR_CALIBRATION_MAGIC_POS]  = MOTOR_CALIBRATION_MAGIC;
			page[MOTOR_CALIBRATION_GAIN_POS]   = motor->calibration_gain;
			page[MOTOR_CALIBRATION_OFFSET_POS] = motor->calibration_offset;
			bootloader_write_eeprom_page(MOTOR_CALIBRATION_PAGE, page);

			break;
		}

		case CALIBRATION_STATE_OFF: {
			break; // Should be unreachable
		}
	}
}


void motor_init(Motor *motor) {
	ccu4_pwm_init(MOTOR_FORWARD_PIN, MOTOR_FORWARD_CCU4_SLICE, MOTOR_PERIOD_VALUE);
	ccu4_pwm_init(MOTOR_REVERSE_PIN, MOTOR_REVERSE_CCU4_SLICE, MOTOR_PERIOD_VALUE);

	motor->drive_mode = MOTORIZED_LINEAR_POTI_DRIVE_MODE_FAST;
	motor->hold_position = false;
	motor->hold_position_time = 0;
	motor->position = 0;
	motor->position_reached = true;
	motor->position_reached_callback_send = true;
	motor->position_reached_callback_enabled = true;
	motor->calibration_state = CALIBRATION_STATE_OFF;

	uint32_t page[EEPROM_PAGE_SIZE/sizeof(uint32_t)];
	bootloader_read_eeprom_page(MOTOR_CALIBRATION_PAGE, page);

	if(page[MOTOR_CALIBRATION_MAGIC_POS] == MOTOR_CALIBRATION_MAGIC) {
		motor->calibration_gain   = page[MOTOR_CALIBRATION_GAIN_POS];
		motor->calibration_offset = page[MOTOR_CALIBRATION_OFFSET_POS];
	} else {
		motor->calibration_gain   = MOTOR_CALIBRATION_GAIN_MULTIPLIER;
		motor->calibration_offset = 0;
	}
}

void motor_new_position(Motor *motor) {
	motor->last_diff_change_time = system_timer_get_ms();
	motor->last_diff = poti_get_value() - motor->position;
}

void motor_tick(Motor *motor) {
	if(motor->calibration_state != CALIBRATION_STATE_OFF) {
		motor_calibrate_tick(motor);
		return;
	}

	if(motor->position_reached && !motor->hold_position) {
		return;
	}

	uint32_t max_speed = MOTOR_SPEED_FAST;
	uint32_t slow_down_diff = 15;
	if(motor->drive_mode == MOTORIZED_LINEAR_POTI_DRIVE_MODE_SMOOTH) {
		max_speed = MOTOR_SPEED_SMOOTH;
		slow_down_diff = 5;
	}

	const uint16_t poti_position = poti_get_value();
	int32_t current_diff = poti_position - motor->position;

	uint32_t speed = max_speed;

	if(ABS(current_diff) < slow_down_diff) {
		if(ABS(current_diff) < 5) {
			speed = MOTOR_SPEED_SLOW_DOWN;
		} else {
			speed = MOTOR_SPEED_SMOOTH;
		}
	}

	if(motor->last_diff == current_diff) {
		if(system_timer_is_time_elapsed_ms(motor->last_diff_change_time, 10)) {
			if(ABS(current_diff) < 10) {
				speed = MOTOR_SPEED_SMOOTH;
			} else {
				speed = max_speed;
			}
		}
	} else {
		motor->last_diff_change_time = system_timer_get_ms();
		motor->last_diff = current_diff;
	}

	if(poti_position < motor->position) {
		ccu4_pwm_set_duty_cycle(MOTOR_REVERSE_CCU4_SLICE, speed);
		ccu4_pwm_set_duty_cycle(MOTOR_FORWARD_CCU4_SLICE, 0);
	} else if(poti_position > motor->position) {
		ccu4_pwm_set_duty_cycle(MOTOR_FORWARD_CCU4_SLICE, speed);
		ccu4_pwm_set_duty_cycle(MOTOR_REVERSE_CCU4_SLICE, 0);
	} else {
		if(motor->hold_position_time == 0) {
			motor->hold_position_time = system_timer_get_ms();
		}

		// active brake
		ccu4_pwm_set_duty_cycle(MOTOR_FORWARD_CCU4_SLICE, 1000);
		ccu4_pwm_set_duty_cycle(MOTOR_REVERSE_CCU4_SLICE, 1000);

		// We only disable the motor if we are sure that we settled at the new position.
		// To be sure we wait for 100ms so we can correct an overshoot
		if(system_timer_is_time_elapsed_ms(motor->hold_position_time, 100)) {
			motor->position_reached = true;
		}
		// Return here so we don't overwrite the hold position time
		return;
	}

	motor->hold_position_time = 0;
}
