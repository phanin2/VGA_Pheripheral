/*
# ECE 540 Project 1, Part3
#
# HEADER CODE for RGBController
#
# Author:	Phanindra Reddy Vemireddy (phanin2@pdx.edu), Bhavani Gunda (gunda@pdx.edu)
# Date:		09-Nov-2023	
#
#
*/

#define GPIO_SWs    0x80001400
#define GPIO_LEDs   0x80001404
#define GPIO_INOUT  0x80001408
#define VGA_ADDR    0x80001500
#define VGA_ADDR2    0x80001504
#define VGA_DATA2    0x80001508
#define VGA_DATA    0x8000150C
#define ROW_MASK    0x000FFC00
#define COLUMN_MASK    0x000003FF

#define ROW_INITAL 50
#define ROW_FINAL 480
#define ROW_OFFSET 25
#define COLUMN_INITAL 125
#define COLUMN_OFFSET 25
#define COLUMN_FINAL 640