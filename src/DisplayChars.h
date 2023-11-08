/*
# ECE 540 Project 1, Part3
#
# HEADER CODE for RGBController
#
# Author:	Phanindra Reddy Vemireddy (phanin2@pdx.edu)
# Date:		30-Oct-2023	
#
#
*/

#define GPIO_SWs    0x80001400
#define GPIO_LEDs   0x80001404
#define GPIO_INOUT  0x80001408
#define RGB_CR1    0x80001900
#define RGB_CR2    0x80001904
#define RGB_DC1    0x80001908
#define RGB_DC2    0x8000190C
#define GPIO2_PBs    0x80001800
#define GPIO2_INOUT  0x80001808
#define BDC_MASK    0x000003FF
#define GDC_MASK    0x000FFC00
#define RDC_MASK    0x3FF00000
#define RGB_ENABLE_MASK    0x80000000
#define LED_ENABLE_MASK    0x8000
#define PWM_ENABLE_MASK    0x4000       
#define BLUE_BTN         0x1                
#define RESET_BTN         0x2                     
#define RED_BTN         0x4
#define GREEN_BTN         0x8
#define SSD_ENABLES     0x80001038
#define SSD_DIGITS     0x8000103C