EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_02x25_Odd_Even J1
U 1 1 5FD62DCD
P 1700 3400
F 0 "J1" H 1750 4817 50  0000 C CNN
F 1 "Conn_01x40" H 1750 4726 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x25_P2.54mm_Horizontal" H 1700 3400 50  0001 C CNN
F 3 "~" H 1700 3400 50  0001 C CNN
	1    1700 3400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0101
U 1 1 5FD64472
P 2350 3300
F 0 "#PWR0101" H 2350 3150 50  0001 C CNN
F 1 "+5V" H 2365 3473 50  0000 C CNN
F 2 "" H 2350 3300 50  0001 C CNN
F 3 "" H 2350 3300 50  0001 C CNN
	1    2350 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 3300 2000 3300
$Comp
L power:+5V #PWR0102
U 1 1 5FD65A34
P 1200 3400
F 0 "#PWR0102" H 1200 3250 50  0001 C CNN
F 1 "+5V" H 1215 3573 50  0000 C CNN
F 2 "" H 1200 3400 50  0001 C CNN
F 3 "" H 1200 3400 50  0001 C CNN
	1    1200 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5FD65E00
P 2350 3400
F 0 "#PWR0103" H 2350 3150 50  0001 C CNN
F 1 "GND" H 2355 3227 50  0000 C CNN
F 2 "" H 2350 3400 50  0001 C CNN
F 3 "" H 2350 3400 50  0001 C CNN
	1    2350 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 3400 2000 3400
$Comp
L power:GND #PWR0104
U 1 1 5FD66D1A
P 1050 3250
F 0 "#PWR0104" H 1050 3000 50  0001 C CNN
F 1 "GND" H 1055 3077 50  0000 C CNN
F 2 "" H 1050 3250 50  0001 C CNN
F 3 "" H 1050 3250 50  0001 C CNN
	1    1050 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 3300 1300 3250
Wire Wire Line
	1300 3250 1050 3250
Wire Wire Line
	1300 3300 1500 3300
Text GLabel 1500 2200 0    50   Input ~ 0
A0
Text GLabel 1500 2300 0    50   Input ~ 0
A1
Text GLabel 1500 2400 0    50   Input ~ 0
A2
Text GLabel 1500 2500 0    50   Input ~ 0
A3
Text GLabel 1500 2600 0    50   Input ~ 0
A4
Text GLabel 1500 2700 0    50   Input ~ 0
A5
Text GLabel 1500 2800 0    50   Input ~ 0
A6
Text GLabel 1500 2900 0    50   Input ~ 0
A7
Text GLabel 1500 3000 0    50   Input ~ 0
A8
Text GLabel 1500 3100 0    50   Input ~ 0
A9
Text GLabel 1500 3200 0    50   Input ~ 0
A10
Text GLabel 1500 3500 0    50   Input ~ 0
A11
Text GLabel 1500 3600 0    50   Input ~ 0
A12
Text GLabel 1500 3700 0    50   Input ~ 0
A13
Text GLabel 1500 3800 0    50   Input ~ 0
A14
Text GLabel 1500 3900 0    50   Input ~ 0
A15
Text GLabel 2000 2200 2    50   BiDi ~ 0
D0
Text GLabel 2000 2300 2    50   BiDi ~ 0
D1
Text GLabel 2000 2400 2    50   BiDi ~ 0
D2
Text GLabel 2000 2500 2    50   BiDi ~ 0
D3
Text GLabel 2000 2600 2    50   BiDi ~ 0
D4
Text GLabel 2000 2700 2    50   BiDi ~ 0
D5
Text GLabel 2000 2800 2    50   BiDi ~ 0
D6
Text GLabel 2000 2900 2    50   BiDi ~ 0
D7
Text GLabel 1500 4600 0    50   Input ~ 0
~RESET~
Text GLabel 2150 4650 2    50   BiDi ~ 0
~NMI~
Text GLabel 1250 4000 0    50   Input ~ 0
RDY
Text GLabel 1250 4100 0    50   Input ~ 0
BE
Text GLabel 1500 4200 0    50   Input ~ 0
CLK
Text GLabel 1500 4300 0    50   Input ~ 0
R~W~
Text GLabel 1500 4500 0    50   Input ~ 0
SYNC
Text GLabel 1250 4400 0    50   Output ~ 0
~IRQ~
Text GLabel 2000 4500 2    50   Input ~ 0
~SLOT_IRQ~
Text GLabel 2000 4400 2    50   BiDi ~ 0
EX3
Text GLabel 2000 4300 2    50   BiDi ~ 0
EX2
Wire Wire Line
	1250 4400 1500 4400
Wire Wire Line
	1250 4000 1500 4000
Wire Wire Line
	1250 4100 1500 4100
Text GLabel 2000 3500 2    50   Output ~ 0
~SSEL~
Text GLabel 2450 3600 2    50   BiDi ~ 0
~INH~
Text GLabel 2000 3700 2    50   Output ~ 0
~SLOT_SEL~
Text GLabel 2000 3800 2    50   BiDi ~ 0
LED1
Text GLabel 2000 3900 2    50   BiDi ~ 0
LED2
Text GLabel 2000 4000 2    50   BiDi ~ 0
LED3
Text GLabel 2000 4100 2    50   BiDi ~ 0
LED4
Text GLabel 2000 3000 2    50   BiDi ~ 0
EX0
Text GLabel 2000 3100 2    50   BiDi ~ 0
EX1
Text GLabel 2000 3200 2    50   BiDi ~ 0
~SLOW~
$Comp
L Device:C_Small C2
U 1 1 60007C79
P 6150 5550
F 0 "C2" H 6242 5596 50  0000 L CNN
F 1 "C_Small" H 6242 5505 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 6150 5550 50  0001 C CNN
F 3 "~" H 6150 5550 50  0001 C CNN
	1    6150 5550
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0107
U 1 1 60007C7F
P 5850 5400
F 0 "#PWR0107" H 5850 5250 50  0001 C CNN
F 1 "+5V" H 5865 5573 50  0000 C CNN
F 2 "" H 5850 5400 50  0001 C CNN
F 3 "" H 5850 5400 50  0001 C CNN
	1    5850 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 5550 5950 5550
Wire Wire Line
	5850 5550 5850 5400
$Comp
L power:GND #PWR0108
U 1 1 60007C89
P 6250 5550
F 0 "#PWR0108" H 6250 5300 50  0001 C CNN
F 1 "GND" H 6255 5377 50  0000 C CNN
F 2 "" H 6250 5550 50  0001 C CNN
F 3 "" H 6250 5550 50  0001 C CNN
	1    6250 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 3400 1500 3400
Text GLabel 2000 4200 2    50   Output ~ 0
CLK_12M
$Comp
L Memory_RAM:IS61C5128AL-10TLI U3
U 1 1 612CE15A
P 8400 3450
F 0 "U3" H 8400 4931 50  0000 C CNN
F 1 "IS61C5128AL-10TLI" H 8400 4840 50  0000 C CNN
F 2 "Package_SO:TSOP-II-44_10.16x18.41mm_P0.8mm" H 7900 4600 50  0001 C CNN
F 3 "http://www.issi.com/WW/pdf/61-64C5128AL.pdf" H 8400 3450 50  0001 C CNN
	1    8400 3450
	1    0    0    -1  
$EndComp
Text GLabel 7800 2350 0    50   Input ~ 0
A0
Text GLabel 7800 2450 0    50   Input ~ 0
A1
Text GLabel 7800 2550 0    50   Input ~ 0
A2
Text GLabel 7800 2650 0    50   Input ~ 0
A3
Text GLabel 7800 2750 0    50   Input ~ 0
A4
Text GLabel 7800 2850 0    50   Input ~ 0
A5
Text GLabel 7800 2950 0    50   Input ~ 0
A6
Text GLabel 7800 3050 0    50   Input ~ 0
A7
Text GLabel 7800 3150 0    50   Input ~ 0
A8
Text GLabel 7800 3250 0    50   Input ~ 0
A9
Text GLabel 7800 3350 0    50   Input ~ 0
A10
Text GLabel 7800 3450 0    50   Input ~ 0
A11
Text GLabel 9000 2350 2    50   BiDi ~ 0
D0
Text GLabel 9000 2450 2    50   BiDi ~ 0
D1
Text GLabel 9000 2550 2    50   BiDi ~ 0
D2
Text GLabel 9000 2650 2    50   BiDi ~ 0
D3
Text GLabel 9000 2750 2    50   BiDi ~ 0
D4
Text GLabel 9000 2850 2    50   BiDi ~ 0
D5
Text GLabel 9000 2950 2    50   BiDi ~ 0
D6
Text GLabel 9000 3050 2    50   BiDi ~ 0
D7
$Comp
L power:GND #PWR0105
U 1 1 612D0405
P 8400 4750
F 0 "#PWR0105" H 8400 4500 50  0001 C CNN
F 1 "GND" H 8405 4577 50  0000 C CNN
F 2 "" H 8400 4750 50  0001 C CNN
F 3 "" H 8400 4750 50  0001 C CNN
	1    8400 4750
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 612D1558
P 8550 1800
F 0 "C1" H 8642 1846 50  0000 L CNN
F 1 "C_Small" H 8642 1755 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 8550 1800 50  0001 C CNN
F 3 "~" H 8550 1800 50  0001 C CNN
	1    8550 1800
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0106
U 1 1 612D155E
P 8250 1650
F 0 "#PWR0106" H 8250 1500 50  0001 C CNN
F 1 "+5V" H 8265 1823 50  0000 C CNN
F 2 "" H 8250 1650 50  0001 C CNN
F 3 "" H 8250 1650 50  0001 C CNN
	1    8250 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 1800 8400 1800
Wire Wire Line
	8250 1800 8250 1650
$Comp
L power:GND #PWR0109
U 1 1 612D1566
P 8650 1800
F 0 "#PWR0109" H 8650 1550 50  0001 C CNN
F 1 "GND" H 8655 1627 50  0000 C CNN
F 2 "" H 8650 1800 50  0001 C CNN
F 3 "" H 8650 1800 50  0001 C CNN
	1    8650 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 2150 8400 1800
Connection ~ 8400 1800
Wire Wire Line
	8400 1800 8250 1800
Wire Wire Line
	2150 4650 2100 4650
Wire Wire Line
	2100 4650 2100 4600
Wire Wire Line
	2100 4600 2000 4600
Wire Wire Line
	2450 3600 2000 3600
Text GLabel 5450 7000 0    50   Input ~ 0
~RESET~
$Comp
L 74xx:74LS00 U1
U 1 1 612D88A9
P 5400 4300
F 0 "U1" H 5400 4625 50  0000 C CNN
F 1 "74HC00" H 5400 4534 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 5400 4300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 5400 4300 50  0001 C CNN
	1    5400 4300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U1
U 2 1 612DA63C
P 5950 4550
F 0 "U1" H 5950 4875 50  0000 C CNN
F 1 "74HC00" H 5950 4784 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 5950 4550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 5950 4550 50  0001 C CNN
	2    5950 4550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U1
U 3 1 612DD661
P 5700 3600
F 0 "U1" H 5700 3925 50  0000 C CNN
F 1 "74HC00" H 5700 3834 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 5700 3600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 5700 3600 50  0001 C CNN
	3    5700 3600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U1
U 5 1 612E0E58
P 10050 2350
F 0 "U1" H 10280 2396 50  0000 L CNN
F 1 "74HC00" H 10280 2305 50  0000 L CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 10050 2350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 10050 2350 50  0001 C CNN
	5    10050 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 612E63FE
P 10200 1700
F 0 "C3" H 10292 1746 50  0000 L CNN
F 1 "C_Small" H 10292 1655 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 10200 1700 50  0001 C CNN
F 3 "~" H 10200 1700 50  0001 C CNN
	1    10200 1700
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR0110
U 1 1 612E6404
P 9900 1550
F 0 "#PWR0110" H 9900 1400 50  0001 C CNN
F 1 "+5V" H 9915 1723 50  0000 C CNN
F 2 "" H 9900 1550 50  0001 C CNN
F 3 "" H 9900 1550 50  0001 C CNN
	1    9900 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 1700 10050 1700
Wire Wire Line
	9900 1700 9900 1550
$Comp
L power:GND #PWR0111
U 1 1 612E640C
P 10300 1700
F 0 "#PWR0111" H 10300 1450 50  0001 C CNN
F 1 "GND" H 10305 1527 50  0000 C CNN
F 2 "" H 10300 1700 50  0001 C CNN
F 3 "" H 10300 1700 50  0001 C CNN
	1    10300 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 1850 10050 1700
Connection ~ 10050 1700
Wire Wire Line
	10050 1700 9900 1700
$Comp
L power:GND #PWR0112
U 1 1 612E6B06
P 10050 2850
F 0 "#PWR0112" H 10050 2600 50  0001 C CNN
F 1 "GND" H 10055 2677 50  0000 C CNN
F 2 "" H 10050 2850 50  0001 C CNN
F 3 "" H 10050 2850 50  0001 C CNN
	1    10050 2850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 612E7176
P 5950 7300
F 0 "#PWR0113" H 5950 7050 50  0001 C CNN
F 1 "GND" H 5955 7127 50  0000 C CNN
F 2 "" H 5950 7300 50  0001 C CNN
F 3 "" H 5950 7300 50  0001 C CNN
	1    5950 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 5700 5950 5550
Connection ~ 5950 5550
Wire Wire Line
	5950 5550 5850 5550
Wire Wire Line
	7800 3950 6550 3950
Wire Wire Line
	7800 4050 6600 4050
Wire Wire Line
	7800 4150 6650 4150
Wire Wire Line
	7800 4350 6700 4350
Wire Wire Line
	6700 4350 6700 5150
Text GLabel 5050 4200 0    50   Input ~ 0
R~W~
Wire Wire Line
	5050 4200 5100 4200
Wire Wire Line
	5100 4200 5100 4400
Connection ~ 5100 4200
Text GLabel 5550 4650 0    50   Input ~ 0
CLK
Wire Wire Line
	5650 4650 5550 4650
Wire Wire Line
	5650 4450 5650 4350
Wire Wire Line
	5650 4350 5700 4350
Wire Wire Line
	5700 4350 5700 4300
Wire Wire Line
	6250 4550 7800 4550
Text GLabel 5300 3500 0    50   BiDi ~ 0
~SSEL~
Wire Wire Line
	5300 3500 5400 3500
Wire Wire Line
	6000 3600 6150 3600
Wire Wire Line
	6150 3600 6150 4450
Wire Wire Line
	6150 4450 7800 4450
Text GLabel 6800 5150 2    50   BiDi ~ 0
~INH~
Wire Wire Line
	6800 5150 6700 5150
Connection ~ 6700 5150
Text GLabel 5400 3700 0    50   Input ~ 0
A15
$Comp
L 74xx:74LS273 U5
U 1 1 612F5268
P 5950 6500
F 0 "U5" H 5950 7481 50  0000 C CNN
F 1 "74HC273" H 5700 7200 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_Socket" H 5950 6500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS273" H 5950 6500 50  0001 C CNN
	1    5950 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 6700 6450 6700
Wire Wire Line
	6700 5150 6700 6700
Wire Wire Line
	6650 6300 6450 6300
Wire Wire Line
	6650 4150 6650 6300
Wire Wire Line
	6600 6200 6450 6200
Wire Wire Line
	6600 4050 6600 6200
Wire Wire Line
	6550 6100 6450 6100
Wire Wire Line
	6550 3950 6550 6100
Wire Wire Line
	6450 6000 6500 6000
Wire Wire Line
	6500 3850 7800 3850
Text GLabel 7800 3750 0    50   Input ~ 0
A14
Text GLabel 7800 3650 0    50   Input ~ 0
A13
Text GLabel 7800 3550 0    50   Input ~ 0
A12
Wire Wire Line
	6500 6000 6500 3850
$Comp
L 74xx:74LS245 U4
U 1 1 6132CB3F
P 3800 6500
F 0 "U4" H 3800 7481 50  0000 C CNN
F 1 "74HC245" H 3600 7200 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_Socket" H 3800 6500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS245" H 3800 6500 50  0001 C CNN
	1    3800 6500
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 6132E2B8
P 3800 7300
F 0 "#PWR0114" H 3800 7050 50  0001 C CNN
F 1 "GND" H 3805 7127 50  0000 C CNN
F 2 "" H 3800 7300 50  0001 C CNN
F 3 "" H 3800 7300 50  0001 C CNN
	1    3800 7300
	-1   0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 61330F0A
P 3600 5550
F 0 "C4" H 3692 5596 50  0000 L CNN
F 1 "C_Small" H 3692 5505 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 3600 5550 50  0001 C CNN
F 3 "~" H 3600 5550 50  0001 C CNN
	1    3600 5550
	0    1    -1   0   
$EndComp
$Comp
L power:+5V #PWR0115
U 1 1 61330F10
P 3900 5400
F 0 "#PWR0115" H 3900 5250 50  0001 C CNN
F 1 "+5V" H 3915 5573 50  0000 C CNN
F 2 "" H 3900 5400 50  0001 C CNN
F 3 "" H 3900 5400 50  0001 C CNN
	1    3900 5400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3700 5550 3800 5550
Wire Wire Line
	3900 5550 3900 5400
$Comp
L power:GND #PWR0116
U 1 1 61330F18
P 3500 5550
F 0 "#PWR0116" H 3500 5300 50  0001 C CNN
F 1 "GND" H 3505 5377 50  0000 C CNN
F 2 "" H 3500 5550 50  0001 C CNN
F 3 "" H 3500 5550 50  0001 C CNN
	1    3500 5550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3800 5700 3800 5550
Connection ~ 3800 5550
Wire Wire Line
	3800 5550 3900 5550
Text GLabel 3300 6000 0    50   BiDi ~ 0
D0
Text GLabel 3300 6100 0    50   BiDi ~ 0
D1
Text GLabel 3300 6200 0    50   BiDi ~ 0
D2
Text GLabel 3300 6300 0    50   BiDi ~ 0
D3
Text GLabel 3300 6400 0    50   BiDi ~ 0
D4
Text GLabel 3300 6500 0    50   BiDi ~ 0
D5
Text GLabel 3300 6700 0    50   BiDi ~ 0
D7
Text GLabel 4450 7000 2    50   Input ~ 0
~SLOT_SEL~
Wire Wire Line
	4300 7000 4450 7000
Text GLabel 4300 6900 2    50   Input ~ 0
R~W~
Text GLabel 2500 6550 0    50   Input ~ 0
~SLOT_SEL~
$Comp
L 74xx:74LS00 U1
U 4 1 6135DDCE
P 2900 6600
F 0 "U1" H 2900 6925 50  0000 C CNN
F 1 "74HC00" H 2900 6834 50  0000 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_Socket" H 2900 6600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 2900 6600 50  0001 C CNN
	4    2900 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 6500 2600 6550
Wire Wire Line
	2500 6550 2600 6550
Connection ~ 2600 6550
Wire Wire Line
	2600 6550 2600 6700
Wire Wire Line
	3300 6600 3200 6600
Wire Wire Line
	4600 6900 4600 6600
Wire Wire Line
	4600 6600 4300 6600
Wire Wire Line
	5450 6700 4300 6700
Wire Wire Line
	4300 6500 5450 6500
Wire Wire Line
	5450 6400 4300 6400
Wire Wire Line
	4300 6300 5450 6300
Wire Wire Line
	5450 6200 4300 6200
Wire Wire Line
	4300 6100 5450 6100
Wire Wire Line
	5450 6000 4300 6000
$Comp
L Device:R_Small R1
U 1 1 61375C55
P 4950 7100
F 0 "R1" H 5009 7146 50  0000 L CNN
F 1 "R_Small" H 5009 7055 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 4950 7100 50  0001 C CNN
F 3 "~" H 4950 7100 50  0001 C CNN
	1    4950 7100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 613762C1
P 4950 7200
F 0 "#PWR0117" H 4950 6950 50  0001 C CNN
F 1 "GND" H 4955 7027 50  0000 C CNN
F 2 "" H 4950 7200 50  0001 C CNN
F 3 "" H 4950 7200 50  0001 C CNN
	1    4950 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 7000 4950 6900
$Comp
L power:GND #PWR0118
U 1 1 6137A47E
P 5000 6550
F 0 "#PWR0118" H 5000 6300 50  0001 C CNN
F 1 "GND" H 5005 6377 50  0000 C CNN
F 2 "" H 5000 6550 50  0001 C CNN
F 3 "" H 5000 6550 50  0001 C CNN
	1    5000 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 6600 5200 6600
Wire Wire Line
	5200 6600 5200 6550
Wire Wire Line
	5200 6550 5000 6550
Connection ~ 4950 6900
Wire Wire Line
	4950 6900 5450 6900
Wire Wire Line
	4600 6900 4950 6900
$Comp
L Device:C_Small C5
U 1 1 61492710
P 8550 1600
F 0 "C5" H 8642 1646 50  0000 L CNN
F 1 "C_Small" H 8642 1555 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D4.3mm_W1.9mm_P5.00mm" H 8550 1600 50  0001 C CNN
F 3 "~" H 8550 1600 50  0001 C CNN
	1    8550 1600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8650 1600 8650 1800
Connection ~ 8650 1800
Wire Wire Line
	8450 1600 8350 1600
Wire Wire Line
	8350 1600 8350 1650
Wire Wire Line
	8350 1650 8250 1650
Connection ~ 8250 1650
$EndSCHEMATC
