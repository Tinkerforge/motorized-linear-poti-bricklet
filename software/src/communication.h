/* motorized-linear-poti-bricklet
 * Copyright (C) 2017 Olaf Lüke <olaf@tinkerforge.com>
 *
 * communication.h: TFP protocol message handling
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

#ifndef COMMUNICATION_H
#define COMMUNICATION_H

#include <stdint.h>
#include <stdbool.h>

#include "bricklib2/protocols/tfp/tfp.h"
#include "bricklib2/bootloader/bootloader.h"

// Default functions
BootloaderHandleMessageResponse handle_message(const void *data, void *response);
void communication_tick(void);
void communication_init(void);

// Constants
#define MOTORIZED_LINEAR_POTI_THRESHOLD_OPTION_OFF 'x'
#define MOTORIZED_LINEAR_POTI_THRESHOLD_OPTION_OUTSIDE 'o'
#define MOTORIZED_LINEAR_POTI_THRESHOLD_OPTION_INSIDE 'i'
#define MOTORIZED_LINEAR_POTI_THRESHOLD_OPTION_SMALLER '<'
#define MOTORIZED_LINEAR_POTI_THRESHOLD_OPTION_GREATER '>'

#define MOTORIZED_LINEAR_POTI_DRIVE_MODE_FAST 0
#define MOTORIZED_LINEAR_POTI_DRIVE_MODE_SMOOTH 1

// Function and callback IDs and structs
#define FID_GET_POSITION 1
#define FID_SET_POSITION_CALLBACK_CONFIGURATION 2
#define FID_GET_POSITION_CALLBACK_CONFIGURATION 3
#define FID_SET_MOTOR_POSITION 5
#define FID_GET_MOTOR_POSITION 6
#define FID_CALIBRATE 7
#define FID_SET_POSITION_REACHED_CALLBACK_CONFIGURATION 8
#define FID_GET_POSITION_REACHED_CALLBACK_CONFIGURATION 9

#define FID_CALLBACK_POSITION 4
#define FID_CALLBACK_POSITION_REACHED 10

typedef struct {
	TFPMessageHeader header;
	uint16_t position;
	uint8_t drive_mode;
	bool hold_position;
} __attribute__((__packed__)) SetMotorPosition;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetMotorPosition;

typedef struct {
	TFPMessageHeader header;
	uint16_t position;
	uint8_t drive_mode;
	bool hold_position;
	bool position_reached;
} __attribute__((__packed__)) GetMotorPosition_Response;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) Calibrate;

typedef struct {
	TFPMessageHeader header;
	bool enabled;
} __attribute__((__packed__)) SetPositionReachedCallbackConfiguration;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetPositionReachedCallbackConfiguration;

typedef struct {
	TFPMessageHeader header;
	bool enabled;
} __attribute__((__packed__)) GetPositionReachedCallbackConfiguration_Response;

typedef struct {
	TFPMessageHeader header;
	uint16_t position;
} __attribute__((__packed__)) PositionReached_Callback;


// Function prototypes
BootloaderHandleMessageResponse set_motor_position(const SetMotorPosition *data);
BootloaderHandleMessageResponse get_motor_position(const GetMotorPosition *data, GetMotorPosition_Response *response);
BootloaderHandleMessageResponse calibrate(const Calibrate *data);
BootloaderHandleMessageResponse set_position_reached_callback_configuration(const SetPositionReachedCallbackConfiguration *data);
BootloaderHandleMessageResponse get_position_reached_callback_configuration(const GetPositionReachedCallbackConfiguration *data, GetPositionReachedCallbackConfiguration_Response *response);

// Callbacks
bool handle_position_callback(void);
bool handle_position_reached_callback(void);

#define COMMUNICATION_CALLBACK_TICK_WAIT_MS 1
#define COMMUNICATION_CALLBACK_HANDLER_NUM 2
#define COMMUNICATION_CALLBACK_LIST_INIT \
	handle_position_callback, \
	handle_position_reached_callback, \


#endif
