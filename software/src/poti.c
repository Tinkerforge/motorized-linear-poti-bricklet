/* motorized-linear-poti-bricklet
 * Copyright (C) 2017 Olaf Lüke <olaf@tinkerforge.com>
 *
 * poti.c: Potentiometer driver
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

#include "poti.h"

#include "motor.h"

#include "configs/config.h"
#include "configs/config_poti.h"

#include "bricklib2/hal/system_timer/system_timer.h"

#include "xmc_vadc.h"
#include "xmc_gpio.h"

extern Motor motor;

#define poti_adc_irq_handler IRQ_Hdlr_15

uint32_t poti_adc_value_sum = 0;
uint32_t poti_adc_value_num = 0;

void __attribute__((optimize("-O3"))) __attribute__ ((section (".ram_code"))) poti_adc_irq_handler(void) {
//	XMC_GPIO_SetOutputHigh(UARTBB_TX_PIN);

	poti_adc_value_sum += (VADC->GLOBRES & 0xFFFF);
	poti_adc_value_num++;

//	XMC_GPIO_SetOutputLow(UARTBB_TX_PIN);
}

void poti_init_adc(Poti *poti) {
	// This structure contains the Global related Configuration.
	const XMC_VADC_GLOBAL_CONFIG_t adc_global_config = {
		.boundary0 = (uint32_t) 0, // Lower boundary value for Normal comparison mode
		.boundary1 = (uint32_t) 0, // Upper boundary value for Normal comparison mode

		.class0 = {
			.sample_time_std_conv     = 31,                      // The Sample time is (2*tadci)
			.conversion_mode_standard = XMC_VADC_CONVMODE_12BIT, // 12bit conversion Selected

		},
		.class1 = {
			.sample_time_std_conv     = 31,                      // The Sample time is (2*tadci)
			.conversion_mode_standard = XMC_VADC_CONVMODE_12BIT, // 12bit conversion Selected

		},

		.data_reduction_control         = 0b11, // Accumulate 4 result values
		.wait_for_read_mode             = 0, // GLOBRES Register will not be overwritten until the previous value is read
		.event_gen_enable               = 1, // Result Event from GLOBRES is enabled
		.disable_sleep_mode_control     = 0  // Sleep mode is enabled
	};


	// Global iclass0 configuration
	const XMC_VADC_GLOBAL_CLASS_t adc_global_iclass_config = {
		.conversion_mode_standard = XMC_VADC_CONVMODE_12BIT,
		.sample_time_std_conv	  = 31,
	};

	// Global Result Register configuration structure
	XMC_VADC_RESULT_CONFIG_t adc_global_result_config = {
		.data_reduction_control = 0b11, // Accumulate 4 result values
		.post_processing_mode   = XMC_VADC_DMM_REDUCTION_MODE,
		.wait_for_read_mode  	= 1, // Enabled
		.part_of_fifo       	= 0, // No FIFO
		.event_gen_enable   	= 1  // Enable Result event
	};

	// LLD Background Scan Init Structure
	const XMC_VADC_BACKGROUND_CONFIG_t adc_background_config = {
		.conv_start_mode   = XMC_VADC_STARTMODE_CIR,       // Conversion start mode selected as cancel inject repeat
		.req_src_priority  = XMC_VADC_GROUP_RS_PRIORITY_1, // Priority of the Background request source in the VADC module
		.trigger_signal    = XMC_VADC_REQ_TR_A,            // If Trigger needed then this denotes the Trigger signal
		.trigger_edge      = XMC_VADC_TRIGGER_EDGE_NONE,   // If Trigger needed then this denotes Trigger edge selected
		.gate_signal       = XMC_VADC_REQ_GT_A,			   // If Gating needed then this denotes the Gating signal
		.timer_mode        = 0,							   // Timer Mode Disabled
		.external_trigger  = 0,                            // Trigger is Disabled
		.req_src_interrupt = 0,                            // Background Request source interrupt Disabled
		.enable_auto_scan  = 1,
		.load_mode         = XMC_VADC_SCAN_LOAD_OVERWRITE
	};


	XMC_VADC_GLOBAL_Init(VADC, &adc_global_config);
	XMC_VADC_GLOBAL_StartupCalibration(VADC);

	// Initialize the Global Conversion class 0
	XMC_VADC_GLOBAL_InputClassInit(VADC, adc_global_iclass_config, XMC_VADC_GROUP_CONV_STD, 0);
	// Initialize the Global Conversion class 1
	XMC_VADC_GLOBAL_InputClassInit(VADC, adc_global_iclass_config, XMC_VADC_GROUP_CONV_STD, 1);

	// Initialize the Background Scan hardware
	XMC_VADC_GLOBAL_BackgroundInit(VADC, &adc_background_config);

	// Initialize the global result register
	XMC_VADC_GLOBAL_ResultInit(VADC, &adc_global_result_config);

	XMC_VADC_GLOBAL_BackgroundAddChannelToSequence(VADC, 0, POTI_ADC_CHANNEL);
	XMC_VADC_GLOBAL_SetResultEventInterruptNode(VADC, XMC_VADC_SR_SHARED_SR0);

	XMC_VADC_GLOBAL_BackgroundTriggerConversion(VADC);

    NVIC_SetPriority(POTI_ADC_IRQ, POTI_ADC_IRQ_PRIORITY);
    NVIC_EnableIRQ(POTI_ADC_IRQ);
}

void poti_update_value(Poti *poti) {
	static uint32_t last_update = 0;
	if(motor.calibration_state != CALIBRATION_STATE_OFF) {
		return;
	}

	if(system_timer_is_time_elapsed_ms(last_update, 1)) {
		NVIC_DisableIRQ(POTI_ADC_IRQ);
//		uartbb_puts("value: "); uartbb_putu(poti_adc_value_num); uartbb_puts(" "); uartbb_putu(poti_adc_value_sum); uartbb_putnl();


		uint32_t calibrated_sum = poti_adc_value_sum;
		if(calibrated_sum < poti_adc_value_num*motor.calibration_offset) {
			calibrated_sum = 0;
		} else {
			calibrated_sum -=  poti_adc_value_num*motor.calibration_offset;
		}
		calibrated_sum = ((uint64_t)(((uint64_t)calibrated_sum) * ((uint64_t)motor.calibration_gain))) / MOTOR_CALIBRATION_GAIN_MULTIPLIER;

		// We want "(poti_adc_value_sum*100 + 2*4095*poti_adc_value_num) / (4*4095*poti_adc_value_num)"
		// this is equivalent to the formula below, but we have less risk of overflow
		if(poti_adc_value_num > 0) {
			poti->value = (calibrated_sum*10 + 819*poti_adc_value_num) / (1638*poti_adc_value_num);
		}

		poti_adc_value_sum = 0;
		poti_adc_value_num = 0;
		last_update = system_timer_get_ms();
		NVIC_EnableIRQ(POTI_ADC_IRQ);
	}
}

void poti_init(Poti *poti) {
	poti_init_adc(poti);
	poti_update_value(poti);
}

void poti_tick(Poti *poti) {
	poti_update_value(poti);
}

extern Poti poti;
uint16_t poti_get_value() {
	return poti.value;
}
