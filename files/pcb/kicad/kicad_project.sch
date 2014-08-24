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
Sheet 1 13
Title ""
Date "24 aug 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 5150 1550 1100 500 
U 53F77746
F0 "nixie" 50
F1 "nixie.sch" 50
F2 "driver_bus" I L 5150 1600 60 
F3 "cathode_bus" I L 5150 1700 60 
$EndSheet
$Comp
L ATMEGA328-A IC1
U 1 1 53F8B1D6
P 3700 4100
F 0 "IC1" H 2950 5350 40  0000 L BNN
F 1 "ATMEGA328-A" H 4100 2700 40  0000 L BNN
F 2 "TQFP32" H 3700 4100 30  0000 C CIN
F 3 "" H 3700 4100 60  0000 C CNN
	1    3700 4100
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 53F8B71E
P 2450 3300
F 0 "R1" V 2530 3300 40  0000 C CNN
F 1 "R" V 2457 3301 40  0000 C CNN
F 2 "~" V 2380 3300 30  0000 C CNN
F 3 "~" H 2450 3300 30  0000 C CNN
	1    2450 3300
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 53F8B8E7
P 2450 3850
F 0 "C1" H 2450 3950 40  0000 L CNN
F 1 "C" H 2456 3765 40  0000 L CNN
F 2 "~" H 2488 3700 30  0000 C CNN
F 3 "~" H 2450 3850 60  0000 C CNN
	1    2450 3850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR2
U 1 1 53F8B917
P 2450 4100
F 0 "#PWR2" H 2450 4100 30  0001 C CNN
F 1 "GND" H 2450 4030 30  0001 C CNN
F 2 "" H 2450 4100 60  0000 C CNN
F 3 "" H 2450 4100 60  0000 C CNN
	1    2450 4100
	1    0    0    -1  
$EndComp
$Sheet
S 1350 4250 500  200 
U 53F8BA4E
F0 "Sheet53F8BA4D" 50
F1 "luminous.sch" 50
F2 "out" I R 1850 4350 60 
$EndSheet
$Sheet
S 1300 1000 1100 500 
U 53F8942B
F0 "Sheet53F8942A" 50
F1 "power.sch" 50
$EndSheet
$Comp
L +5V #PWR4
U 1 1 53F8C682
P 2700 2750
F 0 "#PWR4" H 2700 2840 20  0001 C CNN
F 1 "+5V" H 2700 2840 30  0000 C CNN
F 2 "" H 2700 2750 60  0000 C CNN
F 3 "" H 2700 2750 60  0000 C CNN
	1    2700 2750
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR1
U 1 1 53F8C722
P 2450 3000
F 0 "#PWR1" H 2450 3090 20  0001 C CNN
F 1 "+5V" H 2450 3090 30  0000 C CNN
F 2 "" H 2450 3000 60  0000 C CNN
F 3 "" H 2450 3000 60  0000 C CNN
	1    2450 3000
	1    0    0    -1  
$EndComp
NoConn ~ 2800 4450
$Comp
L GND #PWR3
U 1 1 53F8C82B
P 2650 5400
F 0 "#PWR3" H 2650 5400 30  0001 C CNN
F 1 "GND" H 2650 5330 30  0001 C CNN
F 2 "" H 2650 5400 60  0000 C CNN
F 3 "" H 2650 5400 60  0000 C CNN
	1    2650 5400
	1    0    0    -1  
$EndComp
$Sheet
S 5700 4750 550  200 
U 53F8CD21
F0 "Sheet53F8CD20" 39
F1 "USB.sch" 39
F2 "D+" I L 5700 4800 60 
F3 "D-" I L 5700 4900 60 
$EndSheet
$Comp
L CRYSTAL X1
U 1 1 53F8D38B
P 6000 3750
F 0 "X1" H 6000 3900 60  0000 C CNN
F 1 "CRYSTAL" H 6000 3600 60  0000 C CNN
F 2 "~" H 6000 3750 60  0000 C CNN
F 3 "~" H 6000 3750 60  0000 C CNN
	1    6000 3750
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 53F8D40A
P 6300 3950
F 0 "C4" H 6300 4050 40  0000 L CNN
F 1 "C" H 6306 3865 40  0000 L CNN
F 2 "~" H 6338 3800 30  0000 C CNN
F 3 "~" H 6300 3950 60  0000 C CNN
	1    6300 3950
	1    0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 53F8D419
P 5700 3950
F 0 "C3" H 5700 4050 40  0000 L CNN
F 1 "C" H 5706 3865 40  0000 L CNN
F 2 "~" H 5738 3800 30  0000 C CNN
F 3 "~" H 5700 3950 60  0000 C CNN
	1    5700 3950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR9
U 1 1 53F8D47C
P 5700 4150
F 0 "#PWR9" H 5700 4150 30  0001 C CNN
F 1 "GND" H 5700 4080 30  0001 C CNN
F 2 "" H 5700 4150 60  0000 C CNN
F 3 "" H 5700 4150 60  0000 C CNN
	1    5700 4150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR10
U 1 1 53F8D48B
P 6300 4150
F 0 "#PWR10" H 6300 4150 30  0001 C CNN
F 1 "GND" H 6300 4080 30  0001 C CNN
F 2 "" H 6300 4150 60  0000 C CNN
F 3 "" H 6300 4150 60  0000 C CNN
	1    6300 4150
	1    0    0    -1  
$EndComp
Entry Wire Line
	4750 3000 4850 2900
Entry Wire Line
	4750 3100 4850 3000
Entry Wire Line
	4750 3200 4850 3100
Entry Wire Line
	4850 3850 4950 3750
Entry Wire Line
	4850 3950 4950 3850
Entry Wire Line
	4850 4050 4950 3950
Entry Wire Line
	4850 4150 4950 4050
$Sheet
S 5700 5200 550  300 
U 53F8FD6A
F0 "Sheet53F8FD69" 50
F1 "switch.sch" 50
F2 "A" I L 5700 5250 60 
F3 "B" I L 5700 5350 60 
F4 "Push" I L 5700 5450 60 
$EndSheet
$Comp
L SW_PUSH SW1
U 1 1 53F90D02
P 4800 6600
F 0 "SW1" H 4950 6710 50  0000 C CNN
F 1 "SW_PUSH" H 4800 6520 50  0000 C CNN
F 2 "~" H 4800 6600 60  0000 C CNN
F 3 "~" H 4800 6600 60  0000 C CNN
	1    4800 6600
	0    -1   1    0   
$EndComp
$Comp
L GND #PWR7
U 1 1 53F90D11
P 5050 6900
F 0 "#PWR7" H 5050 6900 30  0001 C CNN
F 1 "GND" H 5050 6830 30  0001 C CNN
F 2 "" H 5050 6900 60  0000 C CNN
F 3 "" H 5050 6900 60  0000 C CNN
	1    5050 6900
	-1   0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 53F90D20
P 5050 6600
F 0 "C2" H 5050 6700 40  0000 L CNN
F 1 "C" H 5056 6515 40  0000 L CNN
F 2 "~" H 5088 6450 30  0000 C CNN
F 3 "~" H 5050 6600 60  0000 C CNN
	1    5050 6600
	-1   0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 53F90D2F
P 5050 6050
F 0 "R3" V 5130 6050 40  0000 C CNN
F 1 "10k" V 5057 6051 40  0000 C CNN
F 2 "~" V 4980 6050 30  0000 C CNN
F 3 "~" H 5050 6050 30  0000 C CNN
	1    5050 6050
	-1   0    0    -1  
$EndComp
$Comp
L +5V #PWR6
U 1 1 53F90D3E
P 5050 5800
F 0 "#PWR6" H 5050 5890 20  0001 C CNN
F 1 "+5V" H 5050 5890 30  0000 C CNN
F 2 "" H 5050 5800 60  0000 C CNN
F 3 "" H 5050 5800 60  0000 C CNN
	1    5050 5800
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR5
U 1 1 53F90DED
P 4800 6900
F 0 "#PWR5" H 4800 6900 30  0001 C CNN
F 1 "GND" H 4800 6830 30  0001 C CNN
F 2 "" H 4800 6900 60  0000 C CNN
F 3 "" H 4800 6900 60  0000 C CNN
	1    4800 6900
	-1   0    0    -1  
$EndComp
$Comp
L DIODE D1
U 1 1 53F911D9
P 5300 6050
F 0 "D1" H 5300 6150 40  0000 C CNN
F 1 "DIODE" H 5300 5950 40  0000 C CNN
F 2 "~" H 5300 6050 60  0000 C CNN
F 3 "~" H 5300 6050 60  0000 C CNN
	1    5300 6050
	0    1    -1   0   
$EndComp
$Comp
L +5V #PWR8
U 1 1 53F911E8
P 5300 5800
F 0 "#PWR8" H 5300 5890 20  0001 C CNN
F 1 "+5V" H 5300 5890 30  0000 C CNN
F 2 "" H 5300 5800 60  0000 C CNN
F 3 "" H 5300 5800 60  0000 C CNN
	1    5300 5800
	-1   0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 53F911F7
P 4800 6050
F 0 "R2" V 4880 6050 40  0000 C CNN
F 1 "R" V 4807 6051 40  0000 C CNN
F 2 "~" V 4730 6050 30  0000 C CNN
F 3 "~" H 4800 6050 30  0000 C CNN
	1    4800 6050
	-1   0    0    -1  
$EndComp
$Sheet
S 5700 3200 550  200 
U 53F91D15
F0 "Sheet53F91D14" 50
F1 "beep.sch" 50
F2 "beep" I L 5700 3300 60 
$EndSheet
$Sheet
S 5700 2400 550  200 
U 53F9209B
F0 "Sheet53F9209A" 50
F1 "remocon.sch" 50
F2 "out" I L 5700 2500 60 
$EndSheet
$Sheet
S 5700 2800 550  200 
U 53F9209D
F0 "Sheet53F9209C" 50
F1 "napion.sch" 50
F2 "out" I L 5700 2900 60 
$EndSheet
$Comp
L R R4
U 1 1 53F944F2
P 6850 1850
F 0 "R4" V 6930 1850 40  0000 C CNN
F 1 "R" V 6857 1851 40  0000 C CNN
F 2 "~" V 6780 1850 30  0000 C CNN
F 3 "~" H 6850 1850 30  0000 C CNN
	1    6850 1850
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 53F94528
P 7000 1950
F 0 "R5" V 7080 1950 40  0000 C CNN
F 1 "R" V 7007 1951 40  0000 C CNN
F 2 "~" V 6930 1950 30  0000 C CNN
F 3 "~" H 7000 1950 30  0000 C CNN
	1    7000 1950
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR12
U 1 1 53F9455E
P 7000 1650
F 0 "#PWR12" H 7000 1740 20  0001 C CNN
F 1 "+5V" H 7000 1740 30  0000 C CNN
F 2 "" H 7000 1650 60  0000 C CNN
F 3 "" H 7000 1650 60  0000 C CNN
	1    7000 1650
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR11
U 1 1 53F9456D
P 6850 1550
F 0 "#PWR11" H 6850 1640 20  0001 C CNN
F 1 "+5V" H 6850 1640 30  0000 C CNN
F 2 "" H 6850 1550 60  0000 C CNN
F 3 "" H 6850 1550 60  0000 C CNN
	1    6850 1550
	1    0    0    -1  
$EndComp
$Sheet
S 7350 2750 550  400 
U 53F905A9
F0 "Sheet53F905A8" 50
F1 "RTC_DS1307.sch" 50
F2 "CLKOUT" I L 7350 3000 60 
F3 "CLKEN" I L 7350 3100 60 
F4 "SDA" I L 7350 2800 60 
F5 "SCL" I L 7350 2900 60 
$EndSheet
$Sheet
S 8450 2750 550  400 
U 53F9A377
F0 "Sheet53F9A376" 50
F1 "LPS331.sch" 50
F2 "SDA" I L 8450 2800 60 
F3 "SCL" I L 8450 2900 60 
$EndSheet
$Sheet
S 9550 2750 550  400 
U 53F9A379
F0 "Sheet53F9A378" 50
F1 "AM2321.sch" 50
F2 "SDA" I L 9550 2800 60 
F3 "SCL" I L 9550 2900 60 
$EndSheet
Wire Wire Line
	7350 2800 7250 2800
Wire Wire Line
	7350 3000 7150 3000
Wire Wire Line
	7150 3000 7150 4600
Wire Wire Line
	7000 1650 7000 1700
Wire Wire Line
	6850 1600 6850 1550
Connection ~ 5700 4150
Connection ~ 6300 4150
Wire Wire Line
	6300 3600 6300 3750
Wire Wire Line
	5700 3700 5700 3750
Wire Wire Line
	5450 4800 5450 4800
Wire Wire Line
	5700 4800 5450 4800
Wire Wire Line
	5400 4900 5350 4900
Wire Wire Line
	5700 4900 5400 4900
Connection ~ 7000 2350
Wire Wire Line
	7000 2350 7250 2350
Wire Wire Line
	7250 2350 8350 2350
Wire Wire Line
	8350 2350 9450 2350
Wire Wire Line
	7000 2200 7000 2350
Wire Wire Line
	7000 2350 7000 4350
Wire Wire Line
	7000 4350 4700 4350
Wire Wire Line
	6850 2250 7150 2250
Wire Wire Line
	7150 2250 8250 2250
Wire Wire Line
	8250 2250 9350 2250
Wire Wire Line
	6850 4250 6850 2250
Wire Wire Line
	6850 2250 6850 2100
Wire Wire Line
	4700 4250 6850 4250
Wire Wire Line
	5050 2500 5800 2500
Wire Wire Line
	5050 4700 5050 2500
Wire Wire Line
	4700 4700 5050 4700
Wire Wire Line
	5150 2900 5700 2900
Wire Wire Line
	5150 5000 5150 2900
Wire Wire Line
	4700 5000 5150 5000
Wire Wire Line
	5250 3300 5700 3300
Wire Wire Line
	5250 3500 5250 3300
Wire Wire Line
	4700 3500 5250 3500
Wire Wire Line
	5250 5250 5700 5250
Wire Wire Line
	5250 5100 5250 5250
Wire Wire Line
	5150 5350 5700 5350
Wire Wire Line
	5150 5200 5150 5350
Wire Wire Line
	5050 5450 5700 5450
Wire Wire Line
	5050 5300 5050 5450
Wire Wire Line
	5300 5850 5300 5800
Connection ~ 4800 6300
Connection ~ 5050 6300
Wire Wire Line
	5300 6300 5300 6250
Wire Wire Line
	4800 4450 4800 5800
Wire Wire Line
	4800 6300 5050 6300
Wire Wire Line
	5050 6300 5300 6300
Wire Wire Line
	5050 6800 5050 6900
Wire Wire Line
	5050 6300 5050 6400
Wire Wire Line
	4700 4450 4800 4450
Wire Wire Line
	7150 4600 4700 4600
Wire Wire Line
	4700 5300 5050 5300
Wire Wire Line
	4700 5200 5150 5200
Wire Wire Line
	4700 5100 5250 5100
Wire Bus Line
	4950 1700 5150 1700
Wire Bus Line
	4950 1700 4950 3750
Wire Bus Line
	4950 3750 4950 3850
Wire Bus Line
	4950 3850 4950 3950
Wire Bus Line
	4950 3950 4950 4050
Wire Wire Line
	4700 4150 4850 4150
Wire Wire Line
	4700 4050 4850 4050
Wire Wire Line
	4700 3950 4850 3950
Wire Wire Line
	4700 3850 4850 3850
Wire Bus Line
	4850 1600 4850 2900
Wire Bus Line
	4850 2900 4850 3000
Wire Bus Line
	4850 3000 4850 3100
Wire Bus Line
	4850 3100 4850 3200
Wire Bus Line
	4850 3200 4850 3300
Wire Wire Line
	4700 3200 4750 3200
Wire Wire Line
	4700 3100 4750 3100
Wire Wire Line
	4700 3000 4750 3000
Connection ~ 5700 3750
Connection ~ 6300 3750
Wire Wire Line
	4700 3600 6300 3600
Wire Wire Line
	4700 3700 5700 3700
Wire Wire Line
	5450 4800 4700 4800
Wire Wire Line
	5350 4900 4700 4900
Connection ~ 2650 5200
Wire Wire Line
	2800 5100 2650 5100
Connection ~ 2650 5300
Wire Wire Line
	2800 5200 2650 5200
Wire Wire Line
	2650 5100 2650 5200
Wire Wire Line
	2650 5200 2650 5300
Wire Wire Line
	2650 5300 2650 5400
Wire Wire Line
	2650 5300 2800 5300
Wire Wire Line
	1850 4350 2800 4350
Wire Wire Line
	2450 3050 2450 3000
Wire Wire Line
	2700 2750 2700 3000
Wire Wire Line
	2700 3000 2700 3100
Wire Wire Line
	2700 3100 2700 3300
Wire Wire Line
	2450 4050 2450 4100
Connection ~ 2450 3600
Wire Wire Line
	2450 3550 2450 3600
Wire Wire Line
	2450 3600 2450 3650
Wire Wire Line
	2450 3600 2800 3600
Connection ~ 2700 3000
Wire Wire Line
	2800 3000 2700 3000
Connection ~ 2700 3100
Wire Wire Line
	2700 3100 2800 3100
Wire Wire Line
	2700 3300 2800 3300
Wire Bus Line
	4850 1600 5150 1600
Wire Wire Line
	7350 2900 7150 2900
Wire Wire Line
	7150 2900 7150 2250
Connection ~ 7150 2250
Wire Wire Line
	7250 2800 7250 2350
Connection ~ 7250 2350
Wire Wire Line
	8450 2800 8350 2800
Wire Wire Line
	8350 2800 8350 2350
Connection ~ 8350 2350
Wire Wire Line
	8450 2900 8250 2900
Wire Wire Line
	8250 2900 8250 2250
Connection ~ 8250 2250
Wire Wire Line
	9550 2800 9450 2800
Wire Wire Line
	9450 2800 9450 2350
Wire Wire Line
	9550 2900 9350 2900
Wire Wire Line
	9350 2900 9350 2250
NoConn ~ 7350 3100
Entry Wire Line
	4750 3300 4850 3200
Entry Wire Line
	4750 3400 4850 3300
Wire Wire Line
	4700 3300 4750 3300
Wire Wire Line
	4750 3400 4700 3400
Connection ~ 6850 2250
$EndSCHEMATC
