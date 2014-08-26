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
Sheet 10 13
Title ""
Date "25 aug 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L SENSOR U13
U 1 1 53FB5E8C
P 5850 3750
F 0 "U13" H 5950 3500 39  0000 C CNN
F 1 "SENSOR" H 5700 3500 39  0000 C CNN
F 2 "~" H 5550 3600 60  0000 C CNN
F 3 "~" H 5550 3600 60  0000 C CNN
	1    5850 3750
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR049
U 1 1 53FB5E9B
P 5850 4300
F 0 "#PWR049" H 5850 4300 30  0001 C CNN
F 1 "GND" H 5850 4230 30  0001 C CNN
F 2 "" H 5850 4300 60  0000 C CNN
F 3 "" H 5850 4300 60  0000 C CNN
	1    5850 4300
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR050
U 1 1 53FB5EB9
P 5850 3200
F 0 "#PWR050" H 5850 3290 20  0001 C CNN
F 1 "+5V" H 5850 3290 30  0000 C CNN
F 2 "" H 5850 3200 60  0000 C CNN
F 3 "" H 5850 3200 60  0000 C CNN
	1    5850 3200
	1    0    0    -1  
$EndComp
Text HLabel 5300 3750 0    60   Input ~ 0
out
Wire Wire Line
	5850 4250 5850 4300
Wire Wire Line
	5850 3250 5850 3200
Wire Wire Line
	5400 3750 5300 3750
$EndSCHEMATC
