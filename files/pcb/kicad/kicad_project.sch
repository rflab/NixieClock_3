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
Sheet 1 11
Title ""
Date "31 aug 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 3450 1900 1100 650 
U 53F77746
F0 "nixie" 50
F1 "nixie.sch" 50
F2 "PB_P[0..4]" I L 3450 2000 60 
F3 "PC_P[0..3]" I L 3450 2400 60 
$EndSheet
$Comp
L ATMEGA328-A IC1
U 1 1 53F8B1D6
P 3100 5400
F 0 "IC1" H 2350 6650 40  0000 L BNN
F 1 "ATMEGA328-A" H 3500 4000 40  0000 L BNN
F 2 "TQFP32" H 3100 5400 30  0000 C CIN
F 3 "" H 3100 5400 60  0000 C CNN
	1    3100 5400
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 53F8B71E
P 1400 4650
F 0 "R1" V 1480 4650 40  0000 C CNN
F 1 "510" V 1407 4651 40  0000 C CNN
F 2 "~" V 1330 4650 30  0000 C CNN
F 3 "~" H 1400 4650 30  0000 C CNN
	1    1400 4650
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 53F8B8E7
P 1400 5100
F 0 "C1" H 1400 5200 40  0000 L CNN
F 1 "0.1u" H 1406 5015 40  0000 L CNN
F 2 "~" H 1438 4950 30  0000 C CNN
F 3 "~" H 1400 5100 60  0000 C CNN
	1    1400 5100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 53F8B917
P 1400 5300
F 0 "#PWR01" H 1400 5300 30  0001 C CNN
F 1 "GND" H 1400 5230 30  0001 C CNN
F 2 "" H 1400 5300 60  0000 C CNN
F 3 "" H 1400 5300 60  0000 C CNN
	1    1400 5300
	1    0    0    -1  
$EndComp
$Sheet
S 1150 5550 500  200 
U 53F8BA4E
F0 "Sheet53F8BA4D" 50
F1 "luminous.sch" 50
F2 "out" I R 1650 5650 60 
$EndSheet
$Sheet
S 1250 1950 1100 500 
U 53F8942B
F0 "Sheet53F8942A" 50
F1 "power.sch" 50
$EndSheet
$Comp
L +5V #PWR02
U 1 1 53F8C682
P 2050 4050
F 0 "#PWR02" H 2050 4140 20  0001 C CNN
F 1 "+5V" H 2050 4140 30  0000 C CNN
F 2 "" H 2050 4050 60  0000 C CNN
F 3 "" H 2050 4050 60  0000 C CNN
	1    2050 4050
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR03
U 1 1 53F8C722
P 1400 4400
F 0 "#PWR03" H 1400 4490 20  0001 C CNN
F 1 "+5V" H 1400 4490 30  0000 C CNN
F 2 "" H 1400 4400 60  0000 C CNN
F 3 "" H 1400 4400 60  0000 C CNN
	1    1400 4400
	1    0    0    -1  
$EndComp
NoConn ~ 2200 5750
$Comp
L GND #PWR04
U 1 1 53F8C82B
P 2050 6700
F 0 "#PWR04" H 2050 6700 30  0001 C CNN
F 1 "GND" H 2050 6630 30  0001 C CNN
F 2 "" H 2050 6700 60  0000 C CNN
F 3 "" H 2050 6700 60  0000 C CNN
	1    2050 6700
	1    0    0    -1  
$EndComp
$Sheet
S 5750 5650 550  200 
U 53F8CD21
F0 "Sheet53F8CD20" 39
F1 "USB.sch" 39
F2 "D+" I L 5750 5700 60 
F3 "D-" I L 5750 5800 60 
$EndSheet
$Comp
L CRYSTAL X1
U 1 1 53F8D38B
P 4800 5050
F 0 "X1" H 4800 5200 60  0000 C CNN
F 1 "12MHz" H 4800 4900 60  0000 C CNN
F 2 "~" H 4800 5050 60  0000 C CNN
F 3 "~" H 4800 5050 60  0000 C CNN
	1    4800 5050
	1    0    0    -1  
$EndComp
$Comp
L C C5
U 1 1 53F8D40A
P 5100 5250
F 0 "C5" H 5100 5350 40  0000 L CNN
F 1 "22p" H 5106 5165 40  0000 L CNN
F 2 "~" H 5138 5100 30  0000 C CNN
F 3 "~" H 5100 5250 60  0000 C CNN
	1    5100 5250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 53F8D47C
P 4500 5450
F 0 "#PWR05" H 4500 5450 30  0001 C CNN
F 1 "GND" H 4500 5380 30  0001 C CNN
F 2 "" H 4500 5450 60  0000 C CNN
F 3 "" H 4500 5450 60  0000 C CNN
	1    4500 5450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 53F8D48B
P 5100 5450
F 0 "#PWR06" H 5100 5450 30  0001 C CNN
F 1 "GND" H 5100 5380 30  0001 C CNN
F 2 "" H 5100 5450 60  0000 C CNN
F 3 "" H 5100 5450 60  0000 C CNN
	1    5100 5450
	1    0    0    -1  
$EndComp
$Sheet
S 5750 6350 550  300 
U 53F8FD6A
F0 "Sheet53F8FD69" 50
F1 "switch.sch" 50
F2 "A" I L 5750 6400 60 
F3 "B" I L 5750 6500 60 
F4 "Push" I L 5750 6600 60 
$EndSheet
$Comp
L SW_PUSH SW1
U 1 1 53F90D02
P 7350 5150
F 0 "SW1" H 7500 5260 50  0000 C CNN
F 1 "SW_PUSH" H 7350 5070 50  0000 C CNN
F 2 "~" H 7350 5150 60  0000 C CNN
F 3 "~" H 7350 5150 60  0000 C CNN
	1    7350 5150
	0    -1   1    0   
$EndComp
$Comp
L GND #PWR07
U 1 1 53F90D11
P 7600 5450
F 0 "#PWR07" H 7600 5450 30  0001 C CNN
F 1 "GND" H 7600 5380 30  0001 C CNN
F 2 "" H 7600 5450 60  0000 C CNN
F 3 "" H 7600 5450 60  0000 C CNN
	1    7600 5450
	-1   0    0    -1  
$EndComp
$Comp
L C C3
U 1 1 53F90D20
P 7600 5150
F 0 "C3" H 7600 5250 40  0000 L CNN
F 1 "10u" H 7450 5050 40  0000 L CNN
F 2 "~" H 7638 5000 30  0000 C CNN
F 3 "~" H 7600 5150 60  0000 C CNN
	1    7600 5150
	-1   0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 53F90D2F
P 7600 4600
F 0 "R3" V 7680 4600 40  0000 C CNN
F 1 "10k" V 7607 4601 40  0000 C CNN
F 2 "~" V 7530 4600 30  0000 C CNN
F 3 "~" H 7600 4600 30  0000 C CNN
	1    7600 4600
	-1   0    0    -1  
$EndComp
$Comp
L +5V #PWR08
U 1 1 53F90D3E
P 7600 4350
F 0 "#PWR08" H 7600 4440 20  0001 C CNN
F 1 "+5V" H 7600 4440 30  0000 C CNN
F 2 "" H 7600 4350 60  0000 C CNN
F 3 "" H 7600 4350 60  0000 C CNN
	1    7600 4350
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR09
U 1 1 53F90DED
P 7350 5500
F 0 "#PWR09" H 7350 5500 30  0001 C CNN
F 1 "GND" H 7350 5430 30  0001 C CNN
F 2 "" H 7350 5500 60  0000 C CNN
F 3 "" H 7350 5500 60  0000 C CNN
	1    7350 5500
	-1   0    0    -1  
$EndComp
$Comp
L DIODE D1
U 1 1 53F911D9
P 7850 4600
F 0 "D1" H 7850 4700 40  0000 C CNN
F 1 "DIODE" H 7850 4500 40  0000 C CNN
F 2 "~" H 7850 4600 60  0000 C CNN
F 3 "~" H 7850 4600 60  0000 C CNN
	1    7850 4600
	0    1    -1   0   
$EndComp
$Comp
L +5V #PWR010
U 1 1 53F911E8
P 7850 4350
F 0 "#PWR010" H 7850 4440 20  0001 C CNN
F 1 "+5V" H 7850 4440 30  0000 C CNN
F 2 "" H 7850 4350 60  0000 C CNN
F 3 "" H 7850 4350 60  0000 C CNN
	1    7850 4350
	-1   0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 53F911F7
P 7350 4600
F 0 "R2" V 7430 4600 40  0000 C CNN
F 1 "1k" V 7357 4601 40  0000 C CNN
F 2 "~" V 7280 4600 30  0000 C CNN
F 3 "~" H 7350 4600 30  0000 C CNN
	1    7350 4600
	-1   0    0    -1  
$EndComp
$Sheet
S 5750 4700 550  200 
U 53F91D15
F0 "Sheet53F91D14" 50
F1 "beep.sch" 50
F2 "beep" I L 5750 4800 60 
$EndSheet
$Sheet
S 5750 5300 550  200 
U 53F9209B
F0 "Sheet53F9209A" 50
F1 "remocon.sch" 50
F2 "out" I L 5750 5400 60 
$EndSheet
$Comp
L R R4
U 1 1 53F944F2
P 7500 2200
F 0 "R4" V 7580 2200 40  0000 C CNN
F 1 "10k" V 7507 2201 40  0000 C CNN
F 2 "~" V 7430 2200 30  0000 C CNN
F 3 "~" H 7500 2200 30  0000 C CNN
	1    7500 2200
	1    0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 53F94528
P 7600 2300
F 0 "R5" V 7680 2300 40  0000 C CNN
F 1 "10k" V 7607 2301 40  0000 C CNN
F 2 "~" V 7530 2300 30  0000 C CNN
F 3 "~" H 7600 2300 30  0000 C CNN
	1    7600 2300
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR011
U 1 1 53F9455E
P 7600 1900
F 0 "#PWR011" H 7600 1990 20  0001 C CNN
F 1 "+5V" H 7600 1990 30  0000 C CNN
F 2 "" H 7600 1900 60  0000 C CNN
F 3 "" H 7600 1900 60  0000 C CNN
	1    7600 1900
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR012
U 1 1 53F9456D
P 7500 1900
F 0 "#PWR012" H 7500 1990 20  0001 C CNN
F 1 "+5V" H 7500 1990 30  0000 C CNN
F 2 "" H 7500 1900 60  0000 C CNN
F 3 "" H 7500 1900 60  0000 C CNN
	1    7500 1900
	1    0    0    -1  
$EndComp
$Sheet
S 7700 3100 550  400 
U 53F905A9
F0 "Sheet53F905A8" 50
F1 "RTC_DS1307.sch" 50
F2 "CLKOUT" I L 7700 3350 60 
F3 "SDA" I L 7700 3150 60 
F4 "SCL" I L 7700 3250 60 
$EndSheet
$Comp
L C C2
U 1 1 53FB7281
P 2050 5150
F 0 "C2" H 2050 5250 40  0000 L CNN
F 1 "0.1u" H 2056 5065 40  0000 L CNN
F 2 "~" H 2088 5000 30  0000 C CNN
F 3 "~" H 2050 5150 60  0000 C CNN
	1    2050 5150
	1    0    0    -1  
$EndComp
Text Label 9400 5750 0    60   ~ 0
PC_P0
Text Label 9400 5850 0    60   ~ 0
PC_P1
Text Label 9400 5950 0    60   ~ 0
PC_P2
Text Label 9400 6050 0    60   ~ 0
PC_P3
Text Label 3000 2400 0    60   ~ 0
PC_P[0..3]
Text Label 3000 2000 0    60   ~ 0
PB_P[0..4]
$Comp
L CONN_6 P1
U 1 1 53FCD3BC
P 5400 2200
F 0 "P1" V 5350 2200 60  0000 C CNN
F 1 "CONN_6" V 5450 2200 60  0000 C CNN
F 2 "~" H 5400 2200 60  0000 C CNN
F 3 "~" H 5400 2200 60  0000 C CNN
	1    5400 2200
	-1   0    0    1   
$EndComp
Text Label 4100 5750 0    60   ~ 0
RESET
Text Label 4150 4800 0    60   ~ 0
SCK
Text Label 5850 2450 0    60   ~ 0
RESET
Text Label 5850 2350 0    60   ~ 0
SCK
Text Label 5850 2150 0    60   ~ 0
MISO
Text Label 4450 4700 0    60   ~ 0
MISO
Text Label 5850 2050 0    60   ~ 0
MOSI
$Comp
L +5V #PWR013
U 1 1 53FCE0E8
P 6150 1850
F 0 "#PWR013" H 6150 1940 20  0001 C CNN
F 1 "+5V" H 6150 1940 30  0000 C CNN
F 2 "" H 6150 1850 60  0000 C CNN
F 3 "" H 6150 1850 60  0000 C CNN
	1    6150 1850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 53FCE0F7
P 6150 2600
F 0 "#PWR014" H 6150 2600 30  0001 C CNN
F 1 "GND" H 6150 2530 30  0001 C CNN
F 2 "" H 6150 2600 60  0000 C CNN
F 3 "" H 6150 2600 60  0000 C CNN
	1    6150 2600
	1    0    0    -1  
$EndComp
Text Notes 5000 2800 0    60   ~ 0
ISP tool (In system programmer)
Text Notes 7250 5700 0    60   ~ 0
Reset circuit\nstartup in 0.1[sec]
Text Notes 1300 2650 0    60   ~ 0
9V in - 170V out, 5V out
$Comp
L MY_PIN52 U17
U 1 1 540098C7
P 10550 4600
F 0 "U17" H 10500 4350 60  0000 C CNN
F 1 "MY_PIN52" V 10550 4650 60  0000 C CNN
F 2 "" H 10550 4600 60  0000 C CNN
F 3 "" H 10550 4600 60  0000 C CNN
	1    10550 4600
	1    0    0    -1  
$EndComp
$Comp
L MY_PIN52 U15
U 1 1 540098D6
P 9050 4600
F 0 "U15" H 9000 4350 60  0000 C CNN
F 1 "MY_PIN52" V 9050 4650 60  0000 C CNN
F 2 "" H 9050 4600 60  0000 C CNN
F 3 "" H 9050 4600 60  0000 C CNN
	1    9050 4600
	1    0    0    -1  
$EndComp
$Comp
L MY_PIN52 U18
U 1 1 54009923
P 10550 5900
F 0 "U18" H 10500 5650 60  0000 C CNN
F 1 "MY_PIN52" V 10550 5950 60  0000 C CNN
F 2 "" H 10550 5900 60  0000 C CNN
F 3 "" H 10550 5900 60  0000 C CNN
	1    10550 5900
	1    0    0    -1  
$EndComp
$Comp
L MY_PIN52 U16
U 1 1 54009929
P 9050 5900
F 0 "U16" H 9000 5650 60  0000 C CNN
F 1 "MY_PIN52" V 9050 5950 60  0000 C CNN
F 2 "" H 9050 5900 60  0000 C CNN
F 3 "" H 9050 5900 60  0000 C CNN
	1    9050 5900
	1    0    0    -1  
$EndComp
Text Notes 8500 4100 0    60   ~ 0
upper board
Text Notes 8500 5400 0    60   ~ 0
lower board
Text Label 4100 5650 0    60   ~ 0
SCL
Text Label 4100 5550 0    60   ~ 0
SDA
Text Label 4100 5450 0    60   ~ 0
PC3
Text Label 4100 5350 0    60   ~ 0
PC2
Text Label 4100 5250 0    60   ~ 0
PC1
Text Label 4100 5150 0    60   ~ 0
PC0
Text Label 9400 4750 0    60   ~ 0
PC3
Text Label 9400 4650 0    60   ~ 0
PC2
Text Label 9400 4550 0    60   ~ 0
PC1
Text Label 9400 4450 0    60   ~ 0
PC0
Text Label 4100 5900 0    60   ~ 0
PD0
Text Label 7050 3350 0    60   ~ 0
PD0
Text Label 7050 4300 0    60   ~ 0
RESET
Text Label 4450 4600 0    60   ~ 0
MOSI
$Comp
L C C4
U 1 1 53F8D419
P 4500 5250
F 0 "C4" H 4500 5350 40  0000 L CNN
F 1 "22p" H 4506 5165 40  0000 L CNN
F 2 "~" H 4538 5100 30  0000 C CNN
F 3 "~" H 4500 5250 60  0000 C CNN
	1    4500 5250
	1    0    0    -1  
$EndComp
Text Label 4100 4700 0    60   ~ 0
PB4
Text Label 4100 4600 0    60   ~ 0
PB3
Text Label 4100 4500 0    60   ~ 0
PB2
Text Label 4100 4400 0    60   ~ 0
PB1
Text Label 4100 4300 0    60   ~ 0
PB0
Text Label 9900 6050 0    60   ~ 0
PB_P4
Text Label 9900 5950 0    60   ~ 0
PB_P3
Text Label 9900 5850 0    60   ~ 0
PB_P2
Text Label 9900 5750 0    60   ~ 0
PB_P1
Text Label 9900 5650 0    60   ~ 0
PB_P0
Text Label 7050 2700 0    60   ~ 0
SCL
Text Label 7050 2600 0    60   ~ 0
SDA
Text Label 9950 4750 0    60   ~ 0
PB4
Text Label 9950 4650 0    60   ~ 0
PB3
Text Label 9950 4550 0    60   ~ 0
PB2
Text Label 9950 4450 0    60   ~ 0
PB1
Text Label 9950 4350 0    60   ~ 0
PB0
Text GLabel 8450 6450 0    60   Input ~ 0
GND_L
$Comp
L GND #PWR015
U 1 1 54041F2D
P 8350 5100
F 0 "#PWR015" H 8350 5100 30  0001 C CNN
F 1 "GND" H 8350 5030 30  0001 C CNN
F 2 "" H 8350 5100 60  0000 C CNN
F 3 "" H 8350 5100 60  0000 C CNN
	1    8350 5100
	1    0    0    -1  
$EndComp
Text GLabel 8450 5550 0    60   Input ~ 0
5V_L
Text GLabel 8450 5950 0    60   Input ~ 0
CLK_PW_L
Text GLabel 8550 4350 0    60   Input ~ 0
CLK_PW_H
Connection ~ 2050 6400
Connection ~ 2050 4600
Connection ~ 7500 2600
Wire Wire Line
	4450 4700 4100 4700
Wire Wire Line
	4100 4600 4450 4600
Wire Wire Line
	9700 2600 9700 3250
Wire Wire Line
	9700 3250 9900 3250
Wire Wire Line
	9800 2700 9800 3150
Wire Wire Line
	9800 3150 9900 3150
Connection ~ 8600 2600
Wire Wire Line
	8600 2600 8600 3250
Wire Wire Line
	8600 3250 8800 3250
Connection ~ 8700 2700
Wire Wire Line
	8700 2700 8700 3150
Wire Wire Line
	8700 3150 8800 3150
Connection ~ 7600 2700
Wire Wire Line
	7600 2550 7600 3150
Wire Wire Line
	7500 2450 7500 3250
Wire Wire Line
	7500 3250 7700 3250
Wire Wire Line
	2050 4600 2200 4600
Wire Wire Line
	2050 4400 2200 4400
Connection ~ 2050 4400
Wire Wire Line
	2200 4300 2050 4300
Connection ~ 2050 4300
Wire Wire Line
	1400 4900 2200 4900
Connection ~ 1400 4900
Wire Wire Line
	2050 4050 2050 4950
Wire Wire Line
	1400 4400 1400 4400
Wire Wire Line
	1650 5650 2200 5650
Wire Wire Line
	2050 6600 2200 6600
Wire Wire Line
	2050 5350 2050 6700
Wire Wire Line
	2050 6500 2200 6500
Connection ~ 2050 6600
Wire Wire Line
	2200 6400 2050 6400
Connection ~ 2050 6500
Wire Wire Line
	4100 4900 5100 4900
Wire Wire Line
	4100 6600 5750 6600
Wire Wire Line
	7600 4850 7600 4950
Wire Wire Line
	7600 5350 7600 5450
Wire Wire Line
	7350 4850 7850 4850
Wire Wire Line
	7850 4850 7850 4800
Connection ~ 7600 4850
Connection ~ 7350 4850
Wire Wire Line
	7850 4400 7850 4350
Wire Wire Line
	4100 4800 5750 4800
Wire Wire Line
	4100 6300 5650 6300
Wire Wire Line
	5650 6300 5650 6100
Wire Wire Line
	5650 6100 5750 6100
Wire Wire Line
	4100 6000 5350 6000
Wire Wire Line
	5350 6000 5350 5400
Wire Wire Line
	5350 5400 5750 5400
Wire Wire Line
	7050 2600 9700 2600
Wire Wire Line
	7050 2700 9800 2700
Wire Wire Line
	5100 4900 5100 5050
Wire Wire Line
	7500 1950 7500 1900
Wire Wire Line
	7600 1900 7600 2050
Wire Wire Line
	7050 3350 7700 3350
Wire Wire Line
	7600 3150 7700 3150
Connection ~ 4500 5050
Connection ~ 5100 5050
Wire Bus Line
	2900 2000 3450 2000
Wire Bus Line
	3000 2400 3450 2400
Wire Wire Line
	7350 5450 7350 5500
Wire Wire Line
	5750 1950 6150 1950
Wire Wire Line
	6150 1950 6150 1850
Wire Wire Line
	5750 2250 6150 2250
Wire Wire Line
	6150 2250 6150 2600
Wire Wire Line
	5750 2050 5850 2050
Wire Wire Line
	5850 2150 5750 2150
Wire Wire Line
	5750 2350 5850 2350
Wire Wire Line
	5850 2450 5750 2450
Wire Notes Line
	8500 4150 11100 4150
Wire Notes Line
	8500 5400 11100 5400
Wire Wire Line
	7350 4350 7350 4300
Wire Wire Line
	7350 4300 7050 4300
Wire Wire Line
	4100 5000 4500 5000
Wire Wire Line
	4500 5000 4500 5050
Wire Wire Line
	4100 6100 5450 6100
Wire Wire Line
	5450 6100 5450 5700
Wire Wire Line
	5450 5700 5750 5700
Wire Wire Line
	5750 5800 5550 5800
Wire Wire Line
	5550 5800 5550 6200
Wire Wire Line
	5550 6200 4100 6200
Wire Wire Line
	4100 6400 5750 6400
Wire Wire Line
	5750 6500 4100 6500
Wire Wire Line
	9950 4650 10150 4650
Wire Wire Line
	9950 4750 10150 4750
Wire Wire Line
	9950 4550 10150 4550
Wire Wire Line
	9950 4450 10150 4450
Wire Wire Line
	9950 4350 10150 4350
Wire Wire Line
	9900 5650 10150 5650
Wire Wire Line
	10150 5750 9900 5750
Wire Wire Line
	9900 5850 10150 5850
Wire Wire Line
	10150 5950 9900 5950
Wire Wire Line
	10150 6050 9900 6050
Wire Wire Line
	10900 6450 8450 6450
Wire Wire Line
	10900 5650 10900 6450
Connection ~ 10900 6050
Wire Wire Line
	8350 4750 8350 5100
Wire Wire Line
	8650 4750 8350 4750
Wire Wire Line
	10900 4350 10900 5000
Wire Wire Line
	10900 5000 8350 5000
Connection ~ 10900 4750
Connection ~ 8350 5000
Connection ~ 10900 5950
Connection ~ 10900 5850
Connection ~ 10900 5750
Connection ~ 8650 4750
Connection ~ 8650 4650
Connection ~ 8650 4550
Wire Wire Line
	8450 5550 9400 5550
Wire Wire Line
	9400 5550 9400 5650
Connection ~ 8650 6450
Connection ~ 8650 6050
Connection ~ 8650 5950
Connection ~ 8650 5850
Wire Wire Line
	8650 5750 8650 6450
Wire Wire Line
	8450 5950 8550 5950
Wire Wire Line
	8550 5950 8550 5650
Wire Wire Line
	8550 5650 8650 5650
Wire Wire Line
	8650 4450 8650 4750
Wire Wire Line
	8550 4350 8650 4350
$Comp
L +5V #PWR016
U 1 1 54045B6C
P 9450 4300
F 0 "#PWR016" H 9450 4390 20  0001 C CNN
F 1 "+5V" H 9450 4390 30  0000 C CNN
F 2 "" H 9450 4300 60  0000 C CNN
F 3 "" H 9450 4300 60  0000 C CNN
	1    9450 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 4350 9450 4350
Wire Wire Line
	9450 4350 9450 4300
Connection ~ 10900 4450
Connection ~ 10900 4550
Connection ~ 10900 4650
$EndSCHEMATC
