EESchema Schematic File Version 2
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
LIBS:special
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
LIBS:mydevice
LIBS:kicad_project-cache
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 12 12
Title ""
Date "23 aug 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L IC_4PIN IC?
U 1 1 53F95897
P 6150 3850
F 0 "IC?" H 6150 4100 39  0000 C CNN
F 1 "AM2321" H 6150 3850 39  0000 C CNN
F 2 "" H 6150 3850 60  0000 C CNN
F 3 "" H 6150 3850 60  0000 C CNN
	1    6150 3850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 53F958B5
P 5600 4350
F 0 "#PWR?" H 5600 4350 30  0001 C CNN
F 1 "GND" H 5600 4280 30  0001 C CNN
F 2 "" H 5600 4350 60  0000 C CNN
F 3 "" H 5600 4350 60  0000 C CNN
	1    5600 4350
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 53F958C4
P 5600 3450
F 0 "#PWR?" H 5600 3540 20  0001 C CNN
F 1 "+5V" H 5600 3540 30  0000 C CNN
F 2 "" H 5600 3450 60  0000 C CNN
F 3 "" H 5600 3450 60  0000 C CNN
	1    5600 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 3700 5600 3700
Wire Wire Line
	5600 3700 5600 3450
Wire Wire Line
	5700 3900 5600 3900
Wire Wire Line
	5600 3900 5600 4350
Wire Wire Line
	5000 4000 5700 4000
Wire Wire Line
	5700 3800 5000 3800
Text HLabel 5000 3800 0    60   Input ~ 0
SDA
Text HLabel 5000 4000 0    60   Input ~ 0
SCL
$EndSCHEMATC