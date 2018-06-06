/* motorized-linear-poti-bricklet
 * Copyright (C) 2017 Olaf Lüke <olaf@tinkerforge.com>
 *
 * communication.c: TFP protocol message handling
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

#include "communication.h"

#include "bricklib2/utility/communication_callback.h"
#include "bricklib2/protocols/tfp/tfp.h"
#include "bricklib2/utility/callback_value.h"

#include "motor.h"
#include "poti.h"

CallbackValue_uint16_t callback_value_position;

extern Motor motor;

BootloaderHandleMessageResponse handle_message(const void *message, void *response) {
	switch(tfp_get_fid_from_message(message)) {
		case FID_GET_POSITION: return get_callback_value_uint16_t(message, response, &callback_value_position);
		case FID_SET_POSITION_CALLBACK_CONFIGURATION: return set_callback_value_callback_configuration_uint16_t(message, &callback_value_position);
		case FID_GET_POSITION_CALLBACK_CONFIGURATION: return get_callback_value_callback_configuration_uint16_t(message, response, &callback_value_position);
		case FID_SET_MOTOR_POSITION: return set_motor_position(message);
		case FID_GET_MOTOR_POSITION: return get_motor_position(message, response);
		case FID_CALIBRATE: return calibrate(message);
		case FID_SET_POSITION_REACHED_CALLBACK_CONFIGURATION: return set_position_reached_callback_configuration(message);
		case FID_GET_POSITION_REACHED_CALLBACK_CONFIGURATION: return get_position_reached_callback_configuration(message, response);
		default: return HANDLE_MESSAGE_RESPONSE_NOT_SUPPORTED;
	}
}


BootloaderHandleMessageResponse set_motor_position(const SetMotorPosition *data) {
	if((data->position > 100) || (data->drive_mode > MOTORIZED_LINEAR_POTI_DRIVE_MODE_SMOOTH)) {
		return HANDLE_MESSAGE_RESPONSE_INVALID_PARAMETER;
	}

	motor.position      = data->position;
	motor.hold_position = data->hold_position;
	motor.drive_mode    = data->drive_mode;

	motor.position_reached = false;
	if(motor.position_reached_callback_enabled) {
		motor.position_reached_callback_send = false;
	}

	motor_new_position(&motor);

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_motor_position(const GetMotorPosition *data, GetMotorPosition_Response *response) {
	response->header.length    = sizeof(GetMotorPosition_Response);
	response->position         = motor.position;
	response->hold_position    = motor.hold_position;
	response->drive_mode       = motor.drive_mode;
	response->position_reached = motor.position_reached;

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse calibrate(const Calibrate *data) {
	motor_calibrate_init(&motor);

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse set_position_reached_callback_configuration(const SetPositionReachedCallbackConfiguration *data) {
	motor.position_reached_callback_enabled = data->enabled;
	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_position_reached_callback_configuration(const GetPositionReachedCallbackConfiguration *data, GetPositionReachedCallbackConfiguration_Response *response) {
	response->header.length = sizeof(GetPositionReachedCallbackConfiguration_Response);
	response->enabled       = motor.position_reached_callback_enabled;

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}


bool handle_position_callback(void) {
	return handle_callback_value_callback_uint16_t(&callback_value_position, FID_CALLBACK_POSITION);
}

bool handle_position_reached_callback(void) {
	static bool is_buffered = false;
	static PositionReached_Callback cb;

	if(!is_buffered) {
		if(motor.position_reached_callback_enabled && motor.position_reached && !motor.position_reached_callback_send) {
			tfp_make_default_header(&cb.header, bootloader_get_uid(), sizeof(PositionReached_Callback), FID_CALLBACK_POSITION_REACHED);
			cb.position = motor.position;

			motor.position_reached_callback_send = true;
		} else {
			return false;
		}
	}

	if(bootloader_spitfp_is_send_possible(&bootloader_status.st)) {
		bootloader_spitfp_send_ack_and_message(&bootloader_status, (uint8_t*)&cb, sizeof(PositionReached_Callback));
		is_buffered = false;
		return true;
	} else {
		is_buffered = true;
	}

	return false;
}

void communication_tick(void) {
	communication_callback_tick();
}

void communication_init(void) {
	callback_value_init_uint16_t(&callback_value_position, poti_get_value);

	communication_callback_init();
}
