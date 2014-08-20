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
Sheet 1 1
Title ""
Date "20 aug 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L ICM7555CD IC1
U 1 1 53F4D256
P 3650 2800
F 0 "IC1" H 3250 3100 60  0000 C CNN
F 1 "ICM7555CD" H 3800 2500 60  0000 C CNN
F 2 "~" H 3550 2800 60  0000 C CNN
F 3 "~" H 3550 2800 60  0000 C CNN
	1    3650 2800
	1    0    0    -1  
$EndComp
$Comp
L ICM7555CD IC2
U 1 1 53F4D4E3
P 6350 1850
F 0 "IC2" H 5950 2150 60  0000 C CNN
F 1 "ICM7555CD" H 6500 1550 60  0000 C CNN
F 2 "~" H 6250 1850 60  0000 C CNN
F 3 "~" H 6250 1850 60  0000 C CNN
	1    6350 1850
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR01
U 1 1 53F4D564
P 2800 1850
F 0 "#PWR01" H 2800 1940 20  0001 C CNN
F 1 "+5V" H 2800 1940 30  0000 C CNN
F 2 "" H 2800 1850 60  0000 C CNN
F 3 "" H 2800 1850 60  0000 C CNN
	1    2800 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 1850 2800 3250
$Comp
L GND #PWR02
U 1 1 53F4D5BB
P 5100 3350
F 0 "#PWR02" H 5100 3350 30  0001 C CNN
F 1 "GND" H 5100 3280 30  0001 C CNN
F 2 "" H 5100 3350 60  0000 C CNN
F 3 "" H 5100 3350 60  0000 C CNN
	1    5100 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 1700 5100 1700
Wire Wire Line
	5100 1700 5100 3350
Wire Wire Line
	2800 2650 2900 2650
Wire Wire Line
	2800 3250 5100 3250
Connection ~ 5100 3250
Wire Wire Line
	7050 1700 7050 1250
Wire Wire Line
	7050 1250 4700 1250
Wire Wire Line
	4700 1250 4700 2650
Connection ~ 2800 2650
Wire Wire Line
	4700 2650 4350 2650
$EndSCHEMATC
