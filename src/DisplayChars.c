/*
# ECE 540 Project 2, App 1
#
# SOLUTION CODE
#
# Author:	Phanindra Reddy Vemireddy (phanin2@pdx.edu)
# Date:		08-Nov-2023	
#
#
# Targeted to Nexys DDR FPGA
#
# VGA Display

*/


#include "DisplayChars.h"
#include <stdio.h>
#include <string.h>
#ifdef NO_SEMIHOSTING
#include "ee_printf.h"
#ifdef CUSTOM_UART
#include <uart.h>
#endif 
#endif

#define READ_REG(dir) (*(volatile unsigned *)dir)
#define WRITE_REG(dir, value) { (*(volatile unsigned *)dir) = (value); }

int main ( void )
{
    int GPIO_En_Value=0xFFFF, switches_value;

    WRITE_REG(GPIO_INOUT, GPIO_En_Value);

    // Initialize Uart
    config_uart();

    while (1) { 
        switches_value = READ_REG(GPIO_SWs);            // Load switches values
       
        switches_value = switches_value >> 16;
        WRITE_REG(GPIO_LEDs, switches_value);           // Write to LEDs

        //Delay 
        // for (int i=0;i<500000;i++){};

    }

    return(0);
}