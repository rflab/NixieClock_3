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
Sheet 6 11
Title ""
Date "31 aug 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 4200 4200 0    60   Input ~ 0
D+
Text HLabel 4200 4050 0    60   Input ~ 0
D-
$Comp
L R R20
U 1 1 53F90F3C
P 4600 4050
F 0 "R20" V 4680 4050 40  0000 C CNN
F 1 "68" V 4607 4051 40  0000 C CNN
F 2 "~" V 4530 4050 30  0000 C CNN
F 3 "~" H 4600 4050 30  0000 C CNN
	1    4600 4050
	0    -1   -1   0   
$EndComp
$Comp
L R R21
U 1 1 53F90F4B
P 4600 4200
F 0 "R21" V 4680 4200 40  0000 C CNN
F 1 "68" V 4607 4201 40  0000 C CNN
F 2 "~" V 4530 4200 30  0000 C CNN
F 3 "~" H 4600 4200 30  0000 C CNN
	1    4600 4200
	0    -1   -1   0   
$EndComp
$Comp
L +5V #PWR030
U 1 1 53F90F9E
P 5300 2950
F 0 "#PWR030" H 5300 3040 20  0001 C CNN
F 1 "+5V" H 5300 3040 30  0000 C CNN
F 2 "" H 5300 2950 60  0000 C CNN
F 3 "" H 5300 2950 60  0000 C CNN
	1    5300 2950
	1    0    0    -1  
$EndComp
$Comp
L R R23
U 1 1 53F90FB6
P 5100 4750
F 0 "R23" V 5180 4750 40  0000 C CNN
F 1 "NC" V 5107 4751 40  0000 C CNN
F 2 "~" V 5030 4750 30  0000 C CNN
F 3 "~" H 5100 4750 30  0000 C CNN
	1    5100 4750
	-1   0    0    1   
$EndComp
$Comp
L R R22
U 1 1 53F91017
P 4950 3450
F 0 "R22" V 5030 3450 40  0000 C CNN
F 1 "2K" V 4957 3451 40  0000 C CNN
F 2 "~" V 4880 3450 30  0000 C CNN
F 3 "~" H 4950 3450 30  0000 C CNN
	1    4950 3450
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR031
U 1 1 53F91040
P 4950 2950
F 0 "#PWR031" H 4950 3040 20  0001 C CNN
F 1 "+5V" H 4950 3040 30  0000 C CNN
F 2 "" H 4950 2950 60  0000 C CNN
F 3 "" H 4950 2950 60  0000 C CNN
	1    4950 2950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR032
U 1 1 53F910A2
P 5100 5050
F 0 "#PWR032" H 5100 5050 30  0001 C CNN
F 1 "GND" H 5100 4980 30  0001 C CNN
F 2 "" H 5100 5050 60  0000 C CNN
F 3 "" H 5100 5050 60  0000 C CNN
	1    5100 5050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR033
U 1 1 53F910B1
P 5300 5050
F 0 "#PWR033" H 5300 5050 30  0001 C CNN
F 1 "GND" H 5300 4980 30  0001 C CNN
F 2 "" H 5300 5050 60  0000 C CNN
F 3 "" H 5300 5050 60  0000 C CNN
	1    5300 5050
	1    0    0    -1  
$EndComp
$Comp
L DIODE D4
U 1 1 53F910F0
P 5300 3650
F 0 "D4" H 5300 3750 40  0000 C CNN
F 1 "DIODE" H 5300 3550 40  0000 C CNN
F 2 "~" H 5300 3650 60  0000 C CNN
F 3 "~" H 5300 3650 60  0000 C CNN
	1    5300 3650
	0    -1   -1   0   
$EndComp
$Comp
L DIODE D3
U 1 1 53F91104
P 5300 3200
F 0 "D3" H 5300 3300 40  0000 C CNN
F 1 "DIODE" H 5300 3100 40  0000 C CNN
F 2 "~" H 5300 3200 60  0000 C CNN
F 3 "~" H 5300 3200 60  0000 C CNN
	1    5300 3200
	0    -1   -1   0   
$EndComp
$Comp
L PWR_FLAG #FLG034
U 1 1 53FCAA4C
P 5550 3800
F 0 "#FLG034" H 5550 3895 30  0001 C CNN
F 1 "PWR_FLAG" H 5550 3980 30  0000 C CNN
F 2 "" H 5550 3800 60  0000 C CNN
F 3 "" H 5550 3800 60  0000 C CNN
	1    5550 3800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR035
U 1 1 53FCBB40
P 6950 4600
F 0 "#PWR035" H 6950 4600 30  0001 C CNN
F 1 "GND" H 6950 4530 30  0001 C CNN
F 2 "" H 6950 4600 60  0000 C CNN
F 3 "" H 6950 4600 60  0000 C CNN
	1    6950 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 4050 5600 4050
Wire Wire Line
	4850 4200 5600 4200
Wire Wire Line
	4200 4050 4350 4050
Wire Wire Line
	4350 4200 4200 4200
Wire Wire Line
	4950 3700 4950 4050
Connection ~ 4950 4050
Wire Wire Line
	4950 3200 4950 2950
Wire Wire Line
	5600 4500 5300 4500
Wire Wire Line
	5300 4500 5300 5050
Wire Wire Line
	5600 4350 5100 4350
Wire Wire Line
	5100 4350 5100 4500
Wire Wire Line
	5100 5000 5100 5050
Wire Wire Line
	5300 3450 5300 3400
Wire Wire Line
	5300 3900 5300 3850
Wire Wire Line
	5300 3000 5300 2950
Wire Wire Line
	5600 3900 5300 3900
Wire Wire Line
	5550 3800 5550 3900
Connection ~ 5550 3900
Wire Wire Line
	6700 3900 6950 3900
Wire Wire Line
	6950 3900 6950 4600
Wire Wire Line
	6700 4050 6950 4050
Connection ~ 6950 4050
Wire Wire Line
	6700 4350 6950 4350
Connection ~ 6950 4350
Wire Wire Line
	6700 4500 6950 4500
Connection ~ 6950 4500
$Comp
L USB_MINI_B CON1
U 1 1 53FCC671
P 6150 4200
F 0 "CON1" H 5900 4650 60  0000 C CNN
F 1 "USB_MINI_B" H 6100 3700 60  0000 C CNN
F 2 "~" H 6150 4200 60  0000 C CNN
F 3 "~" H 6150 4200 60  0000 C CNN
	1    6150 4200
	1    0    0    -1  
$EndComp
$EndSCHEMATC
