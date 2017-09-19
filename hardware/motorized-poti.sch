EESchema Schematic File Version 2
LIBS:tinkerforge
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:Zilog
LIBS:Xicor
LIBS:video
LIBS:ttl_ieee
LIBS:transf
LIBS:switches
LIBS:supertex
LIBS:stm32
LIBS:stm8
LIBS:silabs
LIBS:sensors
LIBS:rfcom
LIBS:relays
LIBS:references
LIBS:pspice
LIBS:Power_Management
LIBS:powerint
LIBS:Oscillators
LIBS:onsemi
LIBS:nxp_armmcu
LIBS:nordicsemi
LIBS:msp430
LIBS:motor_drivers
LIBS:microchip_pic32mcu
LIBS:microchip_pic18mcu
LIBS:microchip_pic16mcu
LIBS:microchip_pic12mcu
LIBS:microchip_pic10mcu
LIBS:microchip_dspic33dsc
LIBS:maxim
LIBS:Lattice
LIBS:ir
LIBS:hc11
LIBS:gennum
LIBS:ftdi
LIBS:ESD_Protection
LIBS:elec-unifil
LIBS:diode
LIBS:dc-dc
LIBS:cmos_ieee
LIBS:brooktre
LIBS:analog_devices
LIBS:Altera
LIBS:actel
LIBS:ac-dc
LIBS:74xgxx
LIBS:motorized-poti-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Motorized Linear Poti Bricklet"
Date "2017-05-19"
Rev "1.0"
Comp "Tinkerforge GmbH"
Comment1 "Licensed under CERN OHL v.1.1"
Comment2 "Copyright (©) 2017, L.Lauer <lukas@tinkerforge.com>"
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 550  7700 0    40   ~ 0
Copyright Tinkerforge GmbH 2017.\nThis documentation describes Open Hardware and is licensed under the\nCERN OHL v. 1.1.\nYou may redistribute and modify this documentation under the terms of the\nCERN OHL v.1.1. (http://ohwr.org/cernohl). This documentation is distributed\nWITHOUT ANY EXPRESS OR IMPLIED WARRANTY, INCLUDING OF\nMERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS FOR A\nPARTICULAR PURPOSE. Please see the CERN OHL v.1.1 for applicable\nconditions\n
$Comp
L DRILL U3
U 1 1 4C6050A5
P 10650 6150
F 0 "U3" H 10700 6200 60  0001 C CNN
F 1 "DRILL" H 10650 6150 60  0000 C CNN
F 2 "kicad-libraries:DRILL_NP" H 10650 6150 60  0001 C CNN
F 3 "" H 10650 6150 60  0001 C CNN
	1    10650 6150
	1    0    0    -1  
$EndComp
$Comp
L DRILL U4
U 1 1 4C6050A2
P 10650 6350
F 0 "U4" H 10700 6400 60  0001 C CNN
F 1 "DRILL" H 10650 6350 60  0000 C CNN
F 2 "kicad-libraries:DRILL_NP" H 10650 6350 60  0001 C CNN
F 3 "" H 10650 6350 60  0001 C CNN
	1    10650 6350
	1    0    0    -1  
$EndComp
$Comp
L DRILL U6
U 1 1 4C60509F
P 11000 6350
F 0 "U6" H 11050 6400 60  0001 C CNN
F 1 "DRILL" H 11000 6350 60  0000 C CNN
F 2 "kicad-libraries:DRILL_NP" H 11000 6350 60  0001 C CNN
F 3 "" H 11000 6350 60  0001 C CNN
	1    11000 6350
	1    0    0    -1  
$EndComp
$Comp
L DRILL U5
U 1 1 4C605099
P 11000 6150
F 0 "U5" H 11050 6200 60  0001 C CNN
F 1 "DRILL" H 11000 6150 60  0000 C CNN
F 2 "kicad-libraries:DRILL_NP" H 11000 6150 60  0001 C CNN
F 3 "" H 11000 6150 60  0001 C CNN
	1    11000 6150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR109
U 1 1 4C5FCF5E
P 2450 1750
F 0 "#PWR109" H 2450 1750 30  0001 C CNN
F 1 "GND" H 2450 1680 30  0001 C CNN
F 2 "" H 2450 1750 60  0001 C CNN
F 3 "" H 2450 1750 60  0001 C CNN
	1    2450 1750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR111
U 1 1 564B5688
P 5750 4500
F 0 "#PWR111" H 5750 4500 30  0001 C CNN
F 1 "GND" H 5750 4430 30  0001 C CNN
F 2 "" H 5750 4500 60  0001 C CNN
F 3 "" H 5750 4500 60  0001 C CNN
	1    5750 4500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR112
U 1 1 564B56B3
P 5950 4500
F 0 "#PWR112" H 5950 4500 30  0001 C CNN
F 1 "GND" H 5950 4430 30  0001 C CNN
F 2 "" H 5950 4500 60  0001 C CNN
F 3 "" H 5950 4500 60  0001 C CNN
	1    5950 4500
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 564B5818
P 5850 3450
F 0 "C1" V 6000 3450 50  0000 L CNN
F 1 "100nF" V 6000 3150 50  0000 L CNN
F 2 "kicad-libraries:C0603E" H 5850 3450 60  0001 C CNN
F 3 "" H 5850 3450 60  0001 C CNN
	1    5850 3450
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR113
U 1 1 564B594F
P 6050 3550
F 0 "#PWR113" H 6050 3550 30  0001 C CNN
F 1 "GND" H 6050 3480 30  0001 C CNN
F 2 "" H 6050 3550 60  0001 C CNN
F 3 "" H 6050 3550 60  0001 C CNN
	1    6050 3550
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR103
U 1 1 564B5A09
P 1350 950
F 0 "#PWR103" H 1350 1040 20  0001 C CNN
F 1 "+5V" H 1300 1050 30  0000 C CNN
F 2 "" H 1350 950 60  0000 C CNN
F 3 "" H 1350 950 60  0000 C CNN
	1    1350 950 
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR114
U 1 1 564B5A4C
P 6400 3050
F 0 "#PWR114" H 6400 3140 20  0001 C CNN
F 1 "+5V" H 6400 3140 30  0000 C CNN
F 2 "" H 6400 3050 60  0000 C CNN
F 3 "" H 6400 3050 60  0000 C CNN
	1    6400 3050
	1    0    0    -1  
$EndComp
$Comp
L INDUCT L1
U 1 1 564B5AE0
P 6400 3350
F 0 "L1" V 6480 3350 50  0000 C CNN
F 1 "DNP" V 6300 3350 50  0000 C CNN
F 2 "C0603E" H 6400 3350 60  0001 C CNN
F 3 "" H 6400 3350 60  0000 C CNN
	1    6400 3350
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 564B5BC5
P 6750 3600
F 0 "C3" V 6600 3550 50  0000 L CNN
F 1 "47uF/10V" V 6900 3300 50  0000 L CNN
F 2 "kicad-libraries:C1206" H 6750 3600 60  0001 C CNN
F 3 "" H 6750 3600 60  0001 C CNN
	1    6750 3600
	0    1    1    0   
$EndComp
$Comp
L GND #PWR115
U 1 1 564B5EE7
P 6950 3650
F 0 "#PWR115" H 6950 3650 30  0001 C CNN
F 1 "GND" H 6950 3580 30  0001 C CNN
F 2 "" H 6950 3650 60  0001 C CNN
F 3 "" H 6950 3650 60  0001 C CNN
	1    6950 3650
	1    0    0    -1  
$EndComp
$Comp
L MOTORIZED_POTI P2
U 1 1 564B6F08
P 8350 3750
F 0 "P2" H 8400 4150 60  0000 C CNN
F 1 "MOTORIZED_POTI" H 8700 3400 60  0000 C CNN
F 2 "MOTORIZED_POTI" H 8350 3750 60  0001 C CNN
F 3 "" H 8350 3750 60  0000 C CNN
	1    8350 3750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR120
U 1 1 564B7534
P 8150 4200
F 0 "#PWR120" H 8150 4200 30  0001 C CNN
F 1 "GND" H 8150 4130 30  0001 C CNN
F 2 "" H 8150 4200 60  0001 C CNN
F 3 "" H 8150 4200 60  0001 C CNN
	1    8150 4200
	1    0    0    -1  
$EndComp
Text GLabel 6950 2800 0    60   Output ~ 0
AIN
Text GLabel 1950 6050 0    60   Input ~ 0
AIN
NoConn ~ 8250 3600
Text Notes 5250 3650 0    39   ~ 0
PWM\nControl
$Comp
L CON-SENSOR2 P1
U 1 1 58BD3A66
P 950 1900
F 0 "P1" H 800 2300 60  0000 C CNN
F 1 "CON-SENSOR2" V 1100 1900 60  0000 C CNN
F 2 "CON-SENSOR2" H 1050 1750 60  0001 C CNN
F 3 "" H 1050 1750 60  0000 C CNN
	1    950  1900
	-1   0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 58BE7CEA
P 2450 1300
F 0 "C2" H 2500 1400 50  0000 L CNN
F 1 "10µF" H 2500 1200 50  0000 L CNN
F 2 "C0805" H 2450 1300 60  0001 C CNN
F 3 "" H 2450 1300 60  0000 C CNN
	1    2450 1300
	1    0    0    -1  
$EndComp
$Comp
L C C5
U 1 1 58BE7DAF
P 1650 1300
F 0 "C5" H 1700 1400 50  0000 L CNN
F 1 "1µF" H 1700 1200 50  0000 L CNN
F 2 "C0603F" H 1650 1300 60  0001 C CNN
F 3 "" H 1650 1300 60  0000 C CNN
	1    1650 1300
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR108
U 1 1 58BE829E
P 2450 950
F 0 "#PWR108" H 2450 800 50  0001 C CNN
F 1 "VCC" H 2450 1050 50  0000 C CNN
F 2 "" H 2450 950 50  0000 C CNN
F 3 "" H 2450 950 50  0000 C CNN
	1    2450 950 
	1    0    0    -1  
$EndComp
Text GLabel 2200 1900 2    47   Output ~ 0
S-CS
Text GLabel 2200 2000 2    47   Output ~ 0
S-CLK
Text GLabel 2200 2100 2    47   Output ~ 0
S-MOSI
Text GLabel 2200 2200 2    47   Input ~ 0
S-MISO
$Comp
L GND #PWR105
U 1 1 58BE8ACE
P 1450 2700
F 0 "#PWR105" H 1450 2700 30  0001 C CNN
F 1 "GND" H 1450 2630 30  0001 C CNN
F 2 "" H 1450 2700 60  0001 C CNN
F 3 "" H 1450 2700 60  0001 C CNN
	1    1450 2700
	1    0    0    -1  
$EndComp
Text GLabel 1850 4750 0    47   Input ~ 0
S-CS
Text GLabel 1850 4850 0    47   Input ~ 0
S-CLK
Text GLabel 1850 4950 0    47   Input ~ 0
S-MOSI
Text GLabel 1950 5850 0    47   Output ~ 0
S-MISO
$Comp
L CONN_01X02 P3
U 1 1 58BEB75B
P 1450 3800
F 0 "P3" H 1450 3950 50  0000 C CNN
F 1 "BOOT" V 1550 3800 50  0000 C CNN
F 2 "kicad-libraries:SolderJumper" H 1450 3700 50  0001 C CNN
F 3 "" H 1450 3700 50  0000 C CNN
	1    1450 3800
	0    -1   -1   0   
$EndComp
$Comp
L LED D1
U 1 1 58BEBD38
P 950 5950
F 0 "D1" H 950 6050 50  0000 C CNN
F 1 "blue" H 950 5850 50  0000 C CNN
F 2 "D0603F" H 950 5950 50  0001 C CNN
F 3 "" H 950 5950 50  0000 C CNN
	1    950  5950
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR101
U 1 1 58BEC3F5
P 700 5700
F 0 "#PWR101" H 700 5550 50  0001 C CNN
F 1 "VCC" H 700 5800 50  0000 C CNN
F 2 "" H 700 5700 50  0000 C CNN
F 3 "" H 700 5700 50  0000 C CNN
	1    700  5700
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 58BED3A3
P 1850 3250
F 0 "C4" H 1900 3350 50  0000 L CNN
F 1 "100nF" H 1900 3150 50  0000 L CNN
F 2 "C0603F" H 1850 3250 60  0001 C CNN
F 3 "" H 1850 3250 60  0000 C CNN
	1    1850 3250
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR106
U 1 1 58BEE62F
P 1850 2950
F 0 "#PWR106" H 1850 2800 50  0001 C CNN
F 1 "VCC" H 1850 3050 50  0000 C CNN
F 2 "" H 1850 2950 50  0000 C CNN
F 3 "" H 1850 2950 50  0000 C CNN
	1    1850 2950
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR110
U 1 1 58BF1EC1
P 5500 3300
F 0 "#PWR110" H 5500 3150 50  0001 C CNN
F 1 "VCC" H 5500 3400 50  0000 C CNN
F 2 "" H 5500 3300 50  0000 C CNN
F 3 "" H 5500 3300 50  0000 C CNN
	1    5500 3300
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR119
U 1 1 58BF22B6
P 8150 3400
F 0 "#PWR119" H 8150 3250 50  0001 C CNN
F 1 "VCC" H 8150 3500 50  0000 C CNN
F 2 "" H 8150 3400 50  0000 C CNN
F 3 "" H 8150 3400 50  0000 C CNN
	1    8150 3400
	1    0    0    -1  
$EndComp
$Comp
L XMC1XXX24 U1
U 1 1 58BF3B03
P 2400 3300
F 0 "U1" H 2250 3700 60  0000 C CNN
F 1 "XMC1100-16" H 2400 2900 60  0000 C CNN
F 2 "kicad-libraries:QFN24-4x4mm-0.5mm" H 2550 4050 60  0001 C CNN
F 3 "" H 2550 4050 60  0000 C CNN
	1    2400 3300
	1    0    0    -1  
$EndComp
$Comp
L XMC1XXX24 U1
U 2 1 58BF3C64
P 2400 4500
F 0 "U1" H 2250 5050 60  0000 C CNN
F 1 "XMC1100-16" H 2400 3950 60  0000 C CNN
F 2 "kicad-libraries:QFN24-4x4mm-0.5mm" H 2550 5250 60  0001 C CNN
F 3 "" H 2550 5250 60  0000 C CNN
	2    2400 4500
	1    0    0    -1  
$EndComp
$Comp
L XMC1XXX24 U1
U 3 1 58BF3D05
P 2400 5400
F 0 "U1" H 2250 5650 60  0000 C CNN
F 1 "XMC1100-16" H 2400 5150 60  0000 C CNN
F 2 "kicad-libraries:QFN24-4x4mm-0.5mm" H 2550 6150 60  0001 C CNN
F 3 "" H 2550 6150 60  0000 C CNN
	3    2400 5400
	1    0    0    -1  
$EndComp
$Comp
L XMC1XXX24 U1
U 4 1 58BF3E27
P 2400 6200
F 0 "U1" H 2250 6650 60  0000 C CNN
F 1 "XMC1100-16" H 2400 5750 60  0000 C CNN
F 2 "kicad-libraries:QFN24-4x4mm-0.5mm" H 2550 6950 60  0001 C CNN
F 3 "" H 2550 6950 60  0000 C CNN
	4    2400 6200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR107
U 1 1 58BEE1EF
P 1850 3650
F 0 "#PWR107" H 1850 3650 30  0001 C CNN
F 1 "GND" H 1850 3580 30  0001 C CNN
F 2 "" H 1850 3650 60  0001 C CNN
F 3 "" H 1850 3650 60  0001 C CNN
	1    1850 3650
	1    0    0    -1  
$EndComp
NoConn ~ 2050 5550
NoConn ~ 2050 5450
NoConn ~ 2050 5350
NoConn ~ 2050 5250
NoConn ~ 2050 4650
NoConn ~ 2050 4550
NoConn ~ 2050 4450
NoConn ~ 2050 4250
NoConn ~ 2050 4150
$Comp
L GND #PWR104
U 1 1 58BF6F9A
P 1400 4100
F 0 "#PWR104" H 1400 4100 30  0001 C CNN
F 1 "GND" H 1400 4030 30  0001 C CNN
F 2 "" H 1400 4100 60  0001 C CNN
F 3 "" H 1400 4100 60  0001 C CNN
	1    1400 4100
	1    0    0    -1  
$EndComp
$Comp
L R_PACK4 RP1
U 1 1 564B5FD5
P 5100 4200
F 0 "RP1" H 5100 4650 40  0000 C CNN
F 1 "1k" H 5100 4150 40  0000 C CNN
F 2 "4X0603" H 5100 4200 60  0001 C CNN
F 3 "" H 5100 4200 60  0000 C CNN
	1    5100 4200
	-1   0    0    -1  
$EndComp
$Comp
L ZXBM5210 U2
U 1 1 564B53E4
P 5850 3950
F 0 "U2" H 5700 4250 60  0000 C CNN
F 1 "ZXBM5210" H 6200 3550 60  0000 C CNN
F 2 "SO-8-EP" H 5850 3950 60  0001 C CNN
F 3 "" H 5850 3950 60  0000 C CNN
	1    5850 3950
	1    0    0    -1  
$EndComp
Text GLabel 4850 3850 0    47   Input ~ 0
FWD
Text GLabel 4850 4150 0    47   Input ~ 0
REV
Text GLabel 1950 6550 0    47   Output ~ 0
FWD
Text GLabel 1950 6450 0    47   Output ~ 0
REV
Wire Wire Line
	5750 4500 5750 4400
Wire Wire Line
	5950 4500 5950 4400
Wire Wire Line
	5650 3450 5500 3450
Wire Wire Line
	5500 3300 5500 3850
Connection ~ 5500 3450
Wire Wire Line
	6050 3550 6050 3450
Wire Wire Line
	6200 3750 6400 3750
Wire Wire Line
	6400 3750 6400 3600
Wire Wire Line
	6400 3100 6400 3050
Connection ~ 6400 3600
Wire Wire Line
	6950 3650 6950 3600
Wire Wire Line
	5400 3950 5500 3950
Wire Wire Line
	7900 4050 6200 4050
Wire Wire Line
	6600 3850 6600 4000
Wire Wire Line
	6600 3850 6200 3850
Wire Wire Line
	8150 3500 8250 3500
Wire Wire Line
	8150 3700 8250 3700
Connection ~ 5500 3750
Wire Wire Line
	1350 1600 1300 1600
Wire Wire Line
	1350 950  1350 1600
Wire Wire Line
	1450 1800 1300 1800
Wire Wire Line
	1450 1050 1450 1800
Wire Wire Line
	1300 1700 2450 1700
Wire Wire Line
	2450 1500 2450 1750
Wire Wire Line
	1650 1500 1650 1700
Connection ~ 1650 1700
Wire Wire Line
	1450 1050 2450 1050
Wire Wire Line
	2450 950  2450 1100
Connection ~ 2450 1700
Wire Wire Line
	1300 1900 1600 1900
Wire Wire Line
	1300 2000 1600 2000
Wire Wire Line
	1300 2100 1600 2100
Wire Wire Line
	1300 2200 1600 2200
Wire Wire Line
	2000 1900 2200 1900
Wire Wire Line
	2000 2000 2200 2000
Wire Wire Line
	2000 2100 2200 2100
Wire Wire Line
	2000 2200 2200 2200
Wire Wire Line
	950  2350 950  2700
Wire Wire Line
	8150 3500 8150 3400
Wire Wire Line
	8150 4200 8150 3700
Wire Wire Line
	2050 3500 1850 3500
Wire Wire Line
	1850 3450 1850 3650
Wire Wire Line
	1850 3050 1850 2950
Wire Wire Line
	1850 3000 2050 3000
Connection ~ 1850 3000
Connection ~ 1850 3500
Wire Wire Line
	2050 3600 1850 3600
Connection ~ 1850 3600
Wire Wire Line
	2050 5850 1950 5850
Wire Wire Line
	2050 4050 1500 4050
Wire Wire Line
	1500 4050 1500 4000
Wire Wire Line
	1400 4000 1400 4100
Wire Wire Line
	1950 6050 2050 6050
Wire Wire Line
	5500 4050 5400 4050
Wire Wire Line
	2050 6450 1950 6450
Wire Wire Line
	2050 6550 1950 6550
$Comp
L R R1
U 1 1 58BEBA9F
P 1450 5950
F 0 "R1" V 1530 5950 50  0000 C CNN
F 1 "1k" V 1450 5950 50  0000 C CNN
F 2 "R0603F" H 1450 5950 60  0001 C CNN
F 3 "" H 1450 5950 60  0000 C CNN
	1    1450 5950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5300 3850 5400 3850
Wire Wire Line
	5400 3850 5400 3950
Wire Wire Line
	5300 4150 5400 4150
Wire Wire Line
	5400 4150 5400 4050
Wire Wire Line
	4900 4150 4850 4150
Wire Wire Line
	4900 3850 4850 3850
NoConn ~ 4900 3950
NoConn ~ 4900 4050
NoConn ~ 5300 4050
NoConn ~ 5300 3950
Connection ~ 2450 1050
Wire Wire Line
	1650 1100 1650 1050
Connection ~ 1650 1050
$Comp
L R_PACK4 RP3
U 1 1 590C974A
P 1800 2250
F 0 "RP3" H 1800 2700 50  0000 C CNN
F 1 "82" H 1800 2200 50  0000 C CNN
F 2 "4X0402" H 1800 2250 50  0001 C CNN
F 3 "" H 1800 2250 50  0000 C CNN
	1    1800 2250
	1    0    0    -1  
$EndComp
$Comp
L C C6
U 1 1 590C9DC5
P 1450 2450
F 0 "C6" H 1500 2550 50  0000 L CNN
F 1 "220pF" H 1500 2350 50  0000 L CNN
F 2 "C0402E" H 1450 2450 60  0001 C CNN
F 3 "" H 1450 2450 60  0000 C CNN
	1    1450 2450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR102
U 1 1 590C9E8E
P 950 2700
F 0 "#PWR102" H 950 2700 30  0001 C CNN
F 1 "GND" H 950 2630 30  0001 C CNN
F 2 "" H 950 2700 60  0001 C CNN
F 3 "" H 950 2700 60  0001 C CNN
	1    950  2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 2700 1450 2650
Wire Wire Line
	1450 2250 1450 2200
Connection ~ 1450 2200
Wire Wire Line
	1850 4750 2050 4750
Wire Wire Line
	1850 4850 2050 4850
Wire Wire Line
	1850 4950 2050 4950
NoConn ~ 2050 6350
NoConn ~ 2050 6150
NoConn ~ 2050 6250
Wire Wire Line
	2050 5950 1700 5950
Wire Wire Line
	1200 5950 1150 5950
Wire Wire Line
	750  5950 700  5950
Wire Wire Line
	700  5950 700  5700
Wire Wire Line
	6400 3600 6550 3600
Wire Wire Line
	8250 3900 7900 3900
Wire Wire Line
	7900 3900 7900 4050
Wire Wire Line
	6600 4000 8250 4000
$Comp
L CONN_01X01 J101
U 1 1 592EE407
P 1650 4350
F 0 "J101" H 1650 4450 50  0000 C CNN
F 1 "Debug" V 1750 4350 50  0000 C CNN
F 2 "DEBUG_PAD" H 1650 4350 50  0001 C CNN
F 3 "" H 1650 4350 50  0001 C CNN
	1    1650 4350
	-1   0    0    1   
$EndComp
Wire Wire Line
	1850 4350 2050 4350
$Comp
L TLV271 U101
U 1 1 592EEFC5
P 7500 2800
F 0 "U101" H 7550 2650 60  0000 L CNN
F 1 "TLV271" H 7300 3100 60  0000 L CNN
F 2 "kicad-libraries:SOT23-5" H 7500 2800 60  0001 C CNN
F 3 "" H 7500 2800 60  0000 C CNN
	1    7500 2800
	-1   0    0    1   
$EndComp
$Comp
L TLV271 U101
U 2 1 592EF06A
P 7500 1800
F 0 "U101" H 7650 2000 60  0000 L CNN
F 1 "TLV271" H 7650 1550 60  0000 L CNN
F 2 "kicad-libraries:SOT23-5" H 7500 1800 60  0001 C CNN
F 3 "" H 7500 1800 60  0000 C CNN
	2    7500 1800
	1    0    0    -1  
$EndComp
$Comp
L C C101
U 1 1 592EF6E1
P 7700 1300
F 0 "C101" V 7850 1300 50  0000 L CNN
F 1 "100nF" V 7850 1000 50  0000 L CNN
F 2 "kicad-libraries:C0603E" H 7700 1300 60  0001 C CNN
F 3 "" H 7700 1300 60  0001 C CNN
	1    7700 1300
	0    -1   -1   0   
$EndComp
$Comp
L VCC #PWR116
U 1 1 592EF95E
P 7500 1200
F 0 "#PWR116" H 7500 1050 50  0001 C CNN
F 1 "VCC" H 7500 1300 50  0000 C CNN
F 2 "" H 7500 1200 50  0000 C CNN
F 3 "" H 7500 1200 50  0000 C CNN
	1    7500 1200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR118
U 1 1 592EFB7A
P 7900 1400
F 0 "#PWR118" H 7900 1400 30  0001 C CNN
F 1 "GND" H 7900 1330 30  0001 C CNN
F 2 "" H 7900 1400 60  0001 C CNN
F 3 "" H 7900 1400 60  0001 C CNN
	1    7900 1400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR117
U 1 1 592EFC82
P 7500 2300
F 0 "#PWR117" H 7500 2300 30  0001 C CNN
F 1 "GND" H 7500 2230 30  0001 C CNN
F 2 "" H 7500 2300 60  0001 C CNN
F 3 "" H 7500 2300 60  0001 C CNN
	1    7500 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 2800 7000 2800
Wire Wire Line
	8000 2900 8000 3800
Wire Wire Line
	8000 3800 8250 3800
Wire Wire Line
	8000 2700 8000 2550
Wire Wire Line
	8000 2550 7000 2550
Wire Wire Line
	7000 2550 7000 2800
Connection ~ 7000 2800
Wire Wire Line
	7500 2300 7500 2200
Wire Wire Line
	7500 1200 7500 1400
Connection ~ 7500 1300
Wire Wire Line
	7900 1400 7900 1300
$EndSCHEMATC
