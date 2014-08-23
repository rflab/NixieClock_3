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
Sheet 4 12
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
L GND #PWR?
U 1 1 53F89A11
P 4100 3300
F 0 "#PWR?" H 4100 3300 30  0001 C CNN
F 1 "GND" H 4100 3230 30  0001 C CNN
F 2 "" H 4100 3300 60  0000 C CNN
F 3 "" H 4100 3300 60  0000 C CNN
	1    4100 3300
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 53F89A17
P 4500 2950
F 0 "C?" H 4500 3050 40  0000 L CNN
F 1 "0.1u" H 4506 2865 40  0000 L CNN
F 2 "~" H 4538 2800 30  0000 C CNN
F 3 "~" H 4500 2950 60  0000 C CNN
	1    4500 2950
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 53F89A1D
P 5650 2750
F 0 "R?" V 5730 2750 40  0000 C CNN
F 1 "10k" V 5657 2751 40  0000 C CNN
F 2 "~" V 5580 2750 30  0000 C CNN
F 3 "~" H 5650 2750 30  0000 C CNN
	1    5650 2750
	-1   0    0    1   
$EndComp
$Comp
L R R?
U 1 1 53F89A23
P 5650 3250
F 0 "R?" V 5730 3250 40  0000 C CNN
F 1 "10k" V 5657 3251 40  0000 C CNN
F 2 "~" V 5580 3250 30  0000 C CNN
F 3 "~" H 5650 3250 30  0000 C CNN
	1    5650 3250
	-1   0    0    1   
$EndComp
$Comp
L VOLUME VR?
U 1 1 53F89A29
P 5650 3750
F 0 "VR?" H 5500 3850 39  0000 C CNN
F 1 "100k" H 5650 3750 39  0000 C CNN
F 2 "" H 5650 3750 60  0000 C CNN
F 3 "" H 5650 3750 60  0000 C CNN
	1    5650 3750
	0    -1   1    0   
$EndComp
$Comp
L ICM7555CD IC?
U 1 1 53F89A2F
P 4500 3500
F 0 "IC?" H 4340 3880 39  0000 C CNN
F 1 "ICM7555CD" H 4490 3110 39  0000 C CNN
F 2 "~" H 4400 3500 60  0000 C CNN
F 3 "~" H 4400 3500 60  0000 C CNN
	1    4500 3500
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 53F89A35
P 5650 4200
F 0 "C?" H 5650 4300 40  0000 L CNN
F 1 "1000p" H 5656 4115 40  0000 L CNN
F 2 "~" H 5688 4050 30  0000 C CNN
F 3 "~" H 5650 4200 60  0000 C CNN
	1    5650 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 3200 4850 2450
Wire Wire Line
	2650 2450 2800 2450
Wire Wire Line
	2800 2450 3150 2450
Wire Wire Line
	3150 2450 3950 2450
Wire Wire Line
	3950 2450 4850 2450
Wire Wire Line
	4850 2450 5800 2450
Wire Wire Line
	5800 2450 7500 2450
Wire Wire Line
	7500 2450 7600 2450
Wire Wire Line
	4850 2950 4700 2950
Wire Wire Line
	4300 2950 4100 2950
Wire Wire Line
	4100 2950 4100 3200
Wire Wire Line
	4100 3200 4100 3300
Wire Wire Line
	5650 3000 5650 3000
Wire Wire Line
	5650 3000 5650 3000
Wire Wire Line
	5450 4000 5450 3750
Wire Wire Line
	3800 4000 5000 4000
Wire Wire Line
	5000 4000 5450 4000
Wire Wire Line
	5450 4000 5650 4000
Wire Wire Line
	5650 4000 5650 4000
Wire Wire Line
	5650 4000 5650 4000
Wire Wire Line
	5800 2450 5800 2500
Wire Wire Line
	5650 3500 5650 3500
Wire Wire Line
	4800 3200 4850 3200
Wire Wire Line
	4850 3200 4850 3200
Wire Wire Line
	4850 3800 4800 3800
Wire Wire Line
	4200 3400 3800 3400
Wire Wire Line
	3800 3400 3800 4000
Wire Wire Line
	4200 3600 3650 3600
Wire Wire Line
	3650 3600 3650 4550
Wire Wire Line
	6900 3350 6900 3650
Wire Wire Line
	6900 3650 6900 3950
Connection ~ 5650 4000
Wire Wire Line
	4850 3200 4850 2950
Connection ~ 5650 3000
$Comp
L R R?
U 1 1 53F89A5A
P 7500 2800
F 0 "R?" V 7580 2800 40  0000 C CNN
F 1 "4.7k" V 7507 2801 40  0000 C CNN
F 2 "~" V 7430 2800 30  0000 C CNN
F 3 "~" H 7500 2800 30  0000 C CNN
	1    7500 2800
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 53F89A60
P 7200 3650
F 0 "R?" V 7280 3650 40  0000 C CNN
F 1 "10K" V 7207 3651 40  0000 C CNN
F 2 "~" V 7130 3650 30  0000 C CNN
F 3 "~" H 7200 3650 30  0000 C CNN
	1    7200 3650
	0    1    1    0   
$EndComp
Wire Wire Line
	7500 3550 7500 3650
Wire Wire Line
	7500 3650 7500 3750
Connection ~ 7500 3650
Wire Wire Line
	7200 3350 6900 3350
Wire Wire Line
	6900 3950 7200 3950
Wire Wire Line
	7500 3150 7500 3050
Wire Wire Line
	7500 2450 7500 2450
Wire Wire Line
	7500 2450 7500 2550
Connection ~ 5800 2450
Wire Wire Line
	7500 4200 7500 4150
Wire Wire Line
	7450 3650 7500 3650
Wire Wire Line
	7500 3650 8000 3650
$Comp
L INDUCTOR L?
U 1 1 53F89A72
P 7900 2450
F 0 "L?" V 7850 2450 40  0000 C CNN
F 1 "220uH" V 8000 2450 40  0000 C CNN
F 2 "~" H 7900 2450 60  0000 C CNN
F 3 "~" H 7900 2450 60  0000 C CNN
	1    7900 2450
	0    -1   -1   0   
$EndComp
Connection ~ 7500 2450
Wire Wire Line
	8200 2450 8300 2450
Wire Wire Line
	8300 2450 8400 2450
Wire Wire Line
	8300 2450 8300 3450
Wire Wire Line
	8300 4200 8300 3850
$Comp
L DIODE D?
U 1 1 53F89A7D
P 8600 2450
F 0 "D?" H 8600 2550 40  0000 C CNN
F 1 "DIODE" H 8600 2350 40  0000 C CNN
F 2 "~" H 8600 2450 60  0000 C CNN
F 3 "~" H 8600 2450 60  0000 C CNN
	1    8600 2450
	1    0    0    -1  
$EndComp
Connection ~ 8300 2450
Wire Wire Line
	8800 2450 8900 2450
Wire Wire Line
	8900 2450 9400 2450
Wire Wire Line
	9400 2450 10050 2450
Wire Wire Line
	9400 2450 9400 3450
$Comp
L C C?
U 1 1 53F89A86
P 9400 3650
F 0 "C?" H 9400 3750 40  0000 L CNN
F 1 "350V 1u" H 9406 3565 40  0000 L CNN
F 2 "~" H 9438 3500 30  0000 C CNN
F 3 "~" H 9400 3650 60  0000 C CNN
	1    9400 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 4900 9400 3850
$Comp
L R R?
U 1 1 53F89A8E
P 8900 2850
F 0 "R?" V 8980 2850 40  0000 C CNN
F 1 "500k" V 8907 2851 40  0000 C CNN
F 2 "~" V 8830 2850 30  0000 C CNN
F 3 "~" H 8900 2850 30  0000 C CNN
	1    8900 2850
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 53F89A94
P 8900 3400
F 0 "R?" V 8980 3400 40  0000 C CNN
F 1 "500k" V 8907 3401 40  0000 C CNN
F 2 "~" V 8830 3400 30  0000 C CNN
F 3 "~" H 8900 3400 30  0000 C CNN
	1    8900 3400
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 53F89A9A
P 8900 4050
F 0 "R?" V 8980 4050 40  0000 C CNN
F 1 "10k" V 8907 4051 40  0000 C CNN
F 2 "~" V 8830 4050 30  0000 C CNN
F 3 "~" H 8900 4050 30  0000 C CNN
	1    8900 4050
	1    0    0    -1  
$EndComp
$Comp
L VOLUME VR?
U 1 1 53F89AA0
P 8900 4600
F 0 "VR?" H 8750 4700 39  0000 C CNN
F 1 "10k" H 8900 4600 39  0000 C CNN
F 2 "" H 8900 4600 60  0000 C CNN
F 3 "" H 8900 4600 60  0000 C CNN
	1    8900 4600
	0    1    1    0   
$EndComp
Wire Wire Line
	8900 3100 8900 3150
Wire Wire Line
	8900 2450 8900 2600
Wire Wire Line
	8900 3650 8900 3750
Wire Wire Line
	8900 3750 8900 3800
Wire Wire Line
	8900 4300 8900 4350
Wire Wire Line
	8900 4900 8900 4850
Wire Wire Line
	9100 4600 9100 4850
Wire Wire Line
	8900 3750 8650 3750
Wire Wire Line
	8650 3750 8650 5000
Wire Wire Line
	4850 4800 4850 3800
Connection ~ 8900 3750
Wire Wire Line
	5650 3000 5450 3000
Wire Wire Line
	5450 3000 5450 3400
Wire Wire Line
	5450 3400 4800 3400
$Comp
L 2SC T?
U 1 1 53F89ABA
P 7400 3350
F 0 "T?" H 7400 3201 40  0000 R CNN
F 1 "2SC" H 7400 3500 40  0000 R CNN
F 2 "TO92" H 7300 3452 29  0000 C CNN
F 3 "~" H 7400 3350 60  0000 C CNN
	1    7400 3350
	1    0    0    -1  
$EndComp
$Comp
L 2SA T?
U 1 1 53F89AC0
P 7400 3950
F 0 "T?" H 7400 3801 40  0000 R CNN
F 1 "2SA" H 7400 4100 40  0000 R CNN
F 2 "TO92" H 7350 4252 29  0000 C CNN
F 3 "~" H 7400 3950 60  0000 C CNN
	1    7400 3950
	1    0    0    1   
$EndComp
Wire Wire Line
	9100 4850 8900 4850
Connection ~ 8900 2450
$Comp
L FET IC?
U 1 1 53F89AC9
P 8200 3650
F 0 "IC?" H 8210 3820 39  0000 R CNN
F 1 "FET" H 8150 3500 39  0000 R CNN
F 2 "" H 8200 3650 60  0000 C CNN
F 3 "" H 8200 3650 60  0000 C CNN
	1    8200 3650
	1    0    0    -1  
$EndComp
$Comp
L +9V #PWR?
U 1 1 53F89A0B
P 2050 2400
F 0 "#PWR?" H 2050 2370 20  0001 C CNN
F 1 "+9V" H 2050 2510 30  0000 C CNN
F 2 "" H 2050 2400 60  0000 C CNN
F 3 "" H 2050 2400 60  0000 C CNN
	1    2050 2400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 53F89B53
P 4850 5350
F 0 "#PWR?" H 4850 5350 30  0001 C CNN
F 1 "GND" H 4850 5280 30  0001 C CNN
F 2 "" H 4850 5350 60  0000 C CNN
F 3 "" H 4850 5350 60  0000 C CNN
	1    4850 5350
	1    0    0    -1  
$EndComp
$Comp
L 2SC T?
U 1 1 53F89B62
P 4950 5000
F 0 "T?" H 4950 4851 40  0000 R CNN
F 1 "2SC" H 4950 5150 40  0000 R CNN
F 2 "~" H 4850 5102 29  0000 C CNN
F 3 "~" H 4950 5000 60  0000 C CNN
	1    4950 5000
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8650 5000 5150 5000
Wire Wire Line
	4850 5200 4850 5350
$Comp
L GND #PWR?
U 1 1 53F89C1D
P 8900 4900
F 0 "#PWR?" H 8900 4900 30  0001 C CNN
F 1 "GND" H 8900 4830 30  0001 C CNN
F 2 "" H 8900 4900 60  0000 C CNN
F 3 "" H 8900 4900 60  0000 C CNN
	1    8900 4900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 53F89C2C
P 9400 4900
F 0 "#PWR?" H 9400 4900 30  0001 C CNN
F 1 "GND" H 9400 4830 30  0001 C CNN
F 2 "" H 9400 4900 60  0000 C CNN
F 3 "" H 9400 4900 60  0000 C CNN
	1    9400 4900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 53F89C3B
P 8300 4200
F 0 "#PWR?" H 8300 4200 30  0001 C CNN
F 1 "GND" H 8300 4130 30  0001 C CNN
F 2 "" H 8300 4200 60  0000 C CNN
F 3 "" H 8300 4200 60  0000 C CNN
	1    8300 4200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 53F89C4A
P 7500 4200
F 0 "#PWR?" H 7500 4200 30  0001 C CNN
F 1 "GND" H 7500 4130 30  0001 C CNN
F 2 "" H 7500 4200 60  0000 C CNN
F 3 "" H 7500 4200 60  0000 C CNN
	1    7500 4200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 53F89C59
P 5650 4400
F 0 "#PWR?" H 5650 4400 30  0001 C CNN
F 1 "GND" H 5650 4330 30  0001 C CNN
F 2 "" H 5650 4400 60  0000 C CNN
F 3 "" H 5650 4400 60  0000 C CNN
	1    5650 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 3800 4200 3800
Wire Wire Line
	3650 4550 6200 4550
Connection ~ 9400 2450
Wire Wire Line
	6850 3650 6900 3650
Wire Wire Line
	6900 3650 6950 3650
Connection ~ 6900 3650
Wire Wire Line
	4100 3200 4200 3200
$Comp
L R R?
U 1 1 53F8A0A8
P 6600 3650
F 0 "R?" V 6680 3650 40  0000 C CNN
F 1 "10k" V 6607 3651 40  0000 C CNN
F 2 "~" V 6530 3650 30  0000 C CNN
F 3 "~" H 6600 3650 30  0000 C CNN
	1    6600 3650
	0    -1   -1   0   
$EndComp
Connection ~ 4850 2450
Wire Wire Line
	6350 3650 6200 3650
Wire Wire Line
	6200 3650 6200 4550
$Comp
L 170V V?
U 1 1 53F8BBF6
P 10050 2400
F 0 "V?" H 10050 2400 60  0001 C CNN
F 1 "170V" H 10060 2500 60  0000 C CNN
F 2 "" H 10050 2400 60  0000 C CNN
F 3 "" H 10050 2400 60  0000 C CNN
	1    10050 2400
	1    0    0    -1  
$EndComp
$Comp
L 3-TERMINAL_REGULATOR IC?
U 1 1 53F8BD05
P 3900 6000
F 0 "IC?" H 4050 5804 60  0000 C CNN
F 1 "3-TERMINAL_REGULATOR" H 3900 6200 60  0000 C CNN
F 2 "~" H 3900 6000 60  0000 C CNN
F 3 "~" H 3900 6000 60  0000 C CNN
	1    3900 6000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 53F8BD14
P 3900 6450
F 0 "#PWR?" H 3900 6450 30  0001 C CNN
F 1 "GND" H 3900 6380 30  0001 C CNN
F 2 "" H 3900 6450 60  0000 C CNN
F 3 "" H 3900 6450 60  0000 C CNN
	1    3900 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 6250 3900 6450
$Comp
L C C?
U 1 1 53F8BD8A
P 3450 6200
F 0 "C?" H 3450 6300 40  0000 L CNN
F 1 "0.1u" H 3450 6100 40  0000 L CNN
F 2 "~" H 3488 6050 30  0000 C CNN
F 3 "~" H 3450 6200 60  0000 C CNN
	1    3450 6200
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 53F8BD97
P 2800 2900
F 0 "C?" H 2800 3000 40  0000 L CNN
F 1 "25V 10u" H 2800 2800 40  0000 L CNN
F 2 "~" H 2838 2750 30  0000 C CNN
F 3 "~" H 2800 2900 60  0000 C CNN
	1    2800 2900
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 53F8BD9D
P 4650 6200
F 0 "C?" H 4650 6300 40  0000 L CNN
F 1 "25V 10u" H 4650 6100 40  0000 L CNN
F 2 "~" H 4688 6050 30  0000 C CNN
F 3 "~" H 4650 6200 60  0000 C CNN
	1    4650 6200
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 53F8BDA3
P 4350 6200
F 0 "C?" H 4350 6300 40  0000 L CNN
F 1 "0.1u" H 4350 6100 40  0000 L CNN
F 2 "~" H 4388 6050 30  0000 C CNN
F 3 "~" H 4350 6200 60  0000 C CNN
	1    4350 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 5950 4350 5950
Wire Wire Line
	4350 5950 4650 5950
Wire Wire Line
	4650 5950 4850 5950
Wire Wire Line
	4350 5950 4350 6000
Wire Wire Line
	4650 5950 4650 6000
Connection ~ 4350 5950
Wire Wire Line
	3150 5950 3450 5950
Wire Wire Line
	3450 5950 3500 5950
Wire Wire Line
	3450 5950 3450 6000
Connection ~ 3450 5950
$Comp
L GND #PWR?
U 1 1 53F8BED7
P 4650 6450
F 0 "#PWR?" H 4650 6450 30  0001 C CNN
F 1 "GND" H 4650 6380 30  0001 C CNN
F 2 "" H 4650 6450 60  0000 C CNN
F 3 "" H 4650 6450 60  0000 C CNN
	1    4650 6450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 53F8BEE6
P 4350 6450
F 0 "#PWR?" H 4350 6450 30  0001 C CNN
F 1 "GND" H 4350 6380 30  0001 C CNN
F 2 "" H 4350 6450 60  0000 C CNN
F 3 "" H 4350 6450 60  0000 C CNN
	1    4350 6450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 53F8BEF5
P 3450 6450
F 0 "#PWR?" H 3450 6450 30  0001 C CNN
F 1 "GND" H 3450 6380 30  0001 C CNN
F 2 "" H 3450 6450 60  0000 C CNN
F 3 "" H 3450 6450 60  0000 C CNN
	1    3450 6450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 53F8BF04
P 2800 3250
F 0 "#PWR?" H 2800 3250 30  0001 C CNN
F 1 "GND" H 2800 3180 30  0001 C CNN
F 2 "" H 2800 3250 60  0000 C CNN
F 3 "" H 2800 3250 60  0000 C CNN
	1    2800 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 6400 4350 6450
Wire Wire Line
	4650 6400 4650 6450
Wire Wire Line
	3450 6400 3450 6450
Wire Wire Line
	2800 3100 2800 3250
Wire Wire Line
	4850 5950 4850 5850
Connection ~ 4650 5950
$Comp
L +5V #PWR?
U 1 1 53F8C12B
P 4850 5850
F 0 "#PWR?" H 4850 5940 20  0001 C CNN
F 1 "+5V" H 4850 5940 30  0000 C CNN
F 2 "" H 4850 5850 60  0000 C CNN
F 3 "" H 4850 5850 60  0000 C CNN
	1    4850 5850
	1    0    0    -1  
$EndComp
$Comp
L FUSE F?
U 1 1 53F8C1A7
P 2400 2450
F 0 "F?" H 2500 2500 40  0000 C CNN
F 1 "FUSE" H 2300 2400 40  0000 C CNN
F 2 "~" H 2400 2450 60  0000 C CNN
F 3 "~" H 2400 2450 60  0000 C CNN
	1    2400 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 2450 2050 2450
Wire Wire Line
	2050 2450 2050 2400
Wire Wire Line
	3150 5950 3150 2450
Connection ~ 3150 2450
Wire Wire Line
	2800 2700 2800 2450
Connection ~ 2800 2450
Connection ~ 5450 4000
Wire Wire Line
	4800 3600 5000 3600
Wire Wire Line
	5000 3600 5000 4000
Connection ~ 5000 4000
Connection ~ 4100 3200
Wire Wire Line
	3950 3800 3950 2450
Connection ~ 3950 2450
Connection ~ 5650 4400
Connection ~ 4850 2950
$EndSCHEMATC