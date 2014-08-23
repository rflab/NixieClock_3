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
Sheet 2 12
Title ""
Date "23 aug 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 3250 1850 0    60   Input ~ 0
170V
$Comp
L VOLUME VR3
U 1 1 53F77DC4
P 3850 1550
F 0 "VR3" H 3700 1650 39  0000 C CNN
F 1 "VOLUME" H 3850 1550 39  0000 C CNN
F 2 "~" H 3850 1550 60  0000 C CNN
F 3 "~" H 3850 1550 60  0000 C CNN
	1    3850 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 1850 3600 1850
Wire Wire Line
	3600 1850 3600 1550
Wire Wire Line
	4100 1550 4100 1350
Wire Wire Line
	4100 1350 3850 1350
$EndSCHEMATC
