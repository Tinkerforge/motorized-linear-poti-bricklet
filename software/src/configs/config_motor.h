/* motorized-linear-poti-bricklet
 * Copyright (C) 2017 Olaf Lüke <olaf@tinkerforge.com>
 *
 * config_motor.h: Motor configuration
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

#ifndef CONFIG_MOTOR_H
#define CONFIG_MOTOR_H

#define MOTOR_PERIOD_VALUE       1000 // A period of 1000 clock cycles is 32khz frequency

#define MOTOR_FORWARD_PIN        P2_11
#define MOTOR_FORWARD_CCU4_SLICE 3

#define MOTOR_REVERSE_PIN        P2_10
#define MOTOR_REVERSE_CCU4_SLICE 2

#endif
