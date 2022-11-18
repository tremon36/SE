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
L MCU_Microchip_PIC16:PIC16F886-IP U2
U 1 1 63628D27
P 6000 3750
F 0 "U2" H 6000 5031 50  0000 C CNN
F 1 "PIC16F886-IP" H 6000 4940 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W7.62mm_LongPads" H 6000 3750 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/41291D.pdf" H 6000 3550 50  0001 C CNN
	1    6000 3750
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:LM7805_TO220 U1
U 1 1 6362AF59
P 1700 1550
F 0 "U1" H 1700 1792 50  0000 C CNN
F 1 "LM7805_TO220" H 1700 1701 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 1700 1775 50  0001 C CIN
F 3 "https://www.onsemi.cn/PowerSolutions/document/MC7800-D.PDF" H 1700 1500 50  0001 C CNN
	1    1700 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C1
U 1 1 6363284C
P 1200 1700
F 0 "C1" H 1315 1746 50  0000 L CNN
F 1 "0.33 uF" H 1315 1655 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 1200 1700 50  0001 C CNN
F 3 "~" H 1200 1700 50  0001 C CNN
	1    1200 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:CP1 C2
U 1 1 636357A6
P 2250 1700
F 0 "C2" H 2365 1746 50  0000 L CNN
F 1 "0.1 uF" H 2365 1655 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 2250 1700 50  0001 C CNN
F 3 "~" H 2250 1700 50  0001 C CNN
	1    2250 1700
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 63636FA2
P 750 1650
F 0 "J1" H 668 1325 50  0000 C CNN
F 1 "Conn_01x02" H 668 1416 50  0000 C CNN
F 2 "TerminalBlock:TerminalBlock_bornier-2_P5.08mm" H 750 1650 50  0001 C CNN
F 3 "~" H 750 1650 50  0001 C CNN
	1    750  1650
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR02
U 1 1 63637AB2
P 2650 1550
F 0 "#PWR02" H 2650 1400 50  0001 C CNN
F 1 "+5V" H 2665 1723 50  0000 C CNN
F 2 "" H 2650 1550 50  0001 C CNN
F 3 "" H 2650 1550 50  0001 C CNN
	1    2650 1550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 63638DF7
P 1700 2150
F 0 "#PWR01" H 1700 1900 50  0001 C CNN
F 1 "GND" H 1705 1977 50  0000 C CNN
F 2 "" H 1700 2150 50  0001 C CNN
F 3 "" H 1700 2150 50  0001 C CNN
	1    1700 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  1550 1200 1550
Wire Wire Line
	950  1650 950  1850
Wire Wire Line
	950  1850 1200 1850
Wire Wire Line
	1400 1550 1200 1550
Connection ~ 1200 1550
Wire Wire Line
	1700 1850 1200 1850
Connection ~ 1200 1850
Wire Wire Line
	1700 1850 2250 1850
Connection ~ 1700 1850
Wire Wire Line
	2000 1550 2250 1550
Wire Wire Line
	1700 2150 1700 1850
Wire Wire Line
	2650 1550 2250 1550
Connection ~ 2250 1550
$Comp
L power:+5V #PWR04
U 1 1 6363BEFB
P 6000 2150
F 0 "#PWR04" H 6000 2000 50  0001 C CNN
F 1 "+5V" H 6015 2323 50  0000 C CNN
F 2 "" H 6000 2150 50  0001 C CNN
F 3 "" H 6000 2150 50  0001 C CNN
	1    6000 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 2150 6000 2650
$Comp
L power:GND #PWR05
U 1 1 6363CFBD
P 6000 5150
F 0 "#PWR05" H 6000 4900 50  0001 C CNN
F 1 "GND" H 6005 4977 50  0000 C CNN
F 2 "" H 6000 5150 50  0001 C CNN
F 3 "" H 6000 5150 50  0001 C CNN
	1    6000 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 5150 6000 5100
Wire Wire Line
	6100 4850 6100 5000
Wire Wire Line
	6100 5000 6000 5000
Connection ~ 6000 5000
Wire Wire Line
	6000 5000 6000 4850
$Comp
L Device:R R1
U 1 1 6363E3A3
P 4250 2650
F 0 "R1" H 4320 2696 50  0000 L CNN
F 1 "5 K" H 4320 2605 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 4180 2650 50  0001 C CNN
F 3 "~" H 4250 2650 50  0001 C CNN
	1    4250 2650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR03
U 1 1 6363F05D
P 4250 2350
F 0 "#PWR03" H 4250 2200 50  0001 C CNN
F 1 "+5V" H 4265 2523 50  0000 C CNN
F 2 "" H 4250 2350 50  0001 C CNN
F 3 "" H 4250 2350 50  0001 C CNN
	1    4250 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 2350 4250 2500
Wire Wire Line
	4700 2950 4250 2950
Wire Wire Line
	4250 2950 4250 2800
Wire Wire Line
	8050 4050 8050 5900
Wire Wire Line
	8050 5900 4250 5900
Wire Wire Line
	4250 5900 4250 2950
Connection ~ 4250 2950
$Comp
L power:+5V #PWR07
U 1 1 63644EC0
P 7800 4250
F 0 "#PWR07" H 7800 4100 50  0001 C CNN
F 1 "+5V" H 7815 4423 50  0000 C CNN
F 2 "" H 7800 4250 50  0001 C CNN
F 3 "" H 7800 4250 50  0001 C CNN
	1    7800 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 636458BE
P 7850 4100
F 0 "#PWR06" H 7850 3850 50  0001 C CNN
F 1 "GND" H 7855 3927 50  0000 C CNN
F 2 "" H 7850 4100 50  0001 C CNN
F 3 "" H 7850 4100 50  0001 C CNN
	1    7850 4100
	-1   0    0    1   
$EndComp
Wire Wire Line
	8200 4350 7600 4350
Wire Wire Line
	7600 4350 7600 4550
Wire Wire Line
	7600 4550 7300 4550
Wire Wire Line
	8200 4450 7300 4450
Wire Wire Line
	2550 4250 4400 4250
Wire Wire Line
	4400 4250 4400 4450
Wire Wire Line
	4400 4450 4700 4450
Wire Wire Line
	2550 4350 3850 4350
Wire Wire Line
	3850 4350 3850 4550
Wire Wire Line
	3850 4550 4700 4550
Wire Wire Line
	3200 4450 3200 5100
Wire Wire Line
	3200 5100 6000 5100
Connection ~ 6000 5100
Wire Wire Line
	6000 5100 6000 5000
$Comp
L Connector_Generic:Conn_01x03 J2
U 1 1 636496D1
P 2350 4350
F 0 "J2" H 2268 4025 50  0000 C CNN
F 1 "Conn_01x03" H 2268 4116 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 2350 4350 50  0001 C CNN
F 3 "~" H 2350 4350 50  0001 C CNN
	1    2350 4350
	-1   0    0    1   
$EndComp
Wire Wire Line
	2550 4450 3200 4450
$Comp
L Device:Crystal Y1
U 1 1 63758460
P 7600 3600
F 0 "Y1" V 7554 3731 50  0000 L CNN
F 1 "Crystal" V 7645 3731 50  0000 L CNN
F 2 "Crystal:Crystal_HC18-U_Vertical" H 7600 3600 50  0001 C CNN
F 3 "~" H 7600 3600 50  0001 C CNN
	1    7600 3600
	0    1    1    0   
$EndComp
$Comp
L Device:C C3
U 1 1 63759C1E
P 7900 3450
F 0 "C3" V 7648 3450 50  0000 C CNN
F 1 "22 pF" V 7739 3450 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 7938 3300 50  0001 C CNN
F 3 "~" H 7900 3450 50  0001 C CNN
	1    7900 3450
	0    1    1    0   
$EndComp
Wire Wire Line
	7300 3550 7350 3550
Wire Wire Line
	7350 3550 7350 3450
Wire Wire Line
	7350 3450 7600 3450
Wire Wire Line
	7300 3650 7400 3650
Wire Wire Line
	7400 3650 7400 3750
Wire Wire Line
	7400 3750 7600 3750
Connection ~ 7600 3750
Wire Wire Line
	7750 3450 7600 3450
Connection ~ 7600 3450
Wire Wire Line
	8050 3450 8100 3450
Wire Wire Line
	8100 3450 8100 3600
Wire Wire Line
	7800 3750 7600 3750
$Comp
L Device:C C4
U 1 1 6375A6BC
P 7950 3750
F 0 "C4" V 7698 3750 50  0000 C CNN
F 1 "22 pF" V 7789 3750 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 7988 3600 50  0001 C CNN
F 3 "~" H 7950 3750 50  0001 C CNN
	1    7950 3750
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR08
U 1 1 637676A1
P 8400 3300
F 0 "#PWR08" H 8400 3050 50  0001 C CNN
F 1 "GND" H 8405 3127 50  0000 C CNN
F 2 "" H 8400 3300 50  0001 C CNN
F 3 "" H 8400 3300 50  0001 C CNN
	1    8400 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 3300 8200 3300
Wire Wire Line
	8200 3300 8200 3600
Wire Wire Line
	8200 3600 8100 3600
Connection ~ 8100 3600
Wire Wire Line
	8100 3600 8100 3750
Wire Wire Line
	8200 4050 8050 4050
$Comp
L Connector_Generic:Conn_01x05 J3
U 1 1 63642787
P 8400 4250
F 0 "J3" H 8480 4292 50  0000 L CNN
F 1 "Conn_01x05" H 8480 4201 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 8400 4250 50  0001 C CNN
F 3 "~" H 8400 4250 50  0001 C CNN
	1    8400 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 6378AD10
P 2250 2850
F 0 "#PWR09" H 2250 2600 50  0001 C CNN
F 1 "GND" H 2255 2677 50  0000 C CNN
F 2 "" H 2250 2850 50  0001 C CNN
F 3 "" H 2250 2850 50  0001 C CNN
	1    2250 2850
	-1   0    0    1   
$EndComp
Wire Wire Line
	8200 4150 7850 4150
Wire Wire Line
	7850 4150 7850 4100
Wire Wire Line
	8200 4250 7800 4250
$Comp
L Connector_Generic:Conn_01x08 J4
U 1 1 6377A1A3
P 1800 3400
F 0 "J4" H 1718 2775 50  0000 C CNN
F 1 "Conn_01x08" H 1718 2866 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 1800 3400 50  0001 C CNN
F 3 "~" H 1800 3400 50  0001 C CNN
	1    1800 3400
	-1   0    0    1   
$EndComp
Wire Wire Line
	2250 2850 2250 3000
Wire Wire Line
	2250 3000 2000 3000
Wire Wire Line
	2000 3100 4500 3100
Wire Wire Line
	4500 3100 4500 4250
Wire Wire Line
	4500 4250 4700 4250
Wire Wire Line
	4700 4150 4400 4150
Wire Wire Line
	4400 4150 4400 3200
Wire Wire Line
	4400 3200 2000 3200
Wire Wire Line
	4600 3300 4600 4050
Wire Wire Line
	4600 4050 4700 4050
Wire Wire Line
	2000 3300 4600 3300
Wire Wire Line
	2000 3400 4050 3400
Wire Wire Line
	4050 3400 4050 1850
Wire Wire Line
	4050 1850 7850 1850
Wire Wire Line
	7850 1850 7850 2950
Wire Wire Line
	7850 2950 7300 2950
Wire Wire Line
	2000 3500 3950 3500
Wire Wire Line
	3950 3500 3950 1700
Wire Wire Line
	3950 1700 7950 1700
Wire Wire Line
	7950 1700 7950 3050
Wire Wire Line
	7950 3050 7300 3050
Wire Wire Line
	2000 3600 4700 3600
Wire Wire Line
	4700 3600 4700 3850
Wire Wire Line
	2000 3700 3950 3700
Wire Wire Line
	3950 3700 3950 3950
Wire Wire Line
	3950 3950 4700 3950
$EndSCHEMATC
