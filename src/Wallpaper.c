/*
# ECE 540 Project 2, App 2
#
# SOLUTION CODE
#
# Author:	Phanindra Reddy Vemireddy (phanin2@pdx.edu), Bhavani Gunda (gunda@pdx.edu)
# Date:		15-Nov-2023	
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
    int row, column, data_reg, addr_reg= 0, addr_reg2 , data, num = 0;
    // int data_ascii;
    int addr_check, data_check;

    WRITE_REG(GPIO_INOUT, GPIO_En_Value);

    // Initialize Uart
    config_uart();


    while (1) { 
        switches_value = READ_REG(GPIO_SWs);            // Load switches values
       
        switches_value = switches_value >> 16;
        WRITE_REG(GPIO_LEDs, switches_value);           // Write to LEDs

        
        row = ROW_INITAL;
        addr_reg = (addr_reg & ~ROW_MASK) | (row << 10);

        while (row < ROW_FINAL) { 
            column = COLUMN_INITAL;
            addr_reg = (addr_reg & ~COLUMN_MASK) | (column);
            addr_reg2 = (addr_reg & ~COLUMN_MASK) | (column+10);

            while (column < COLUMN_FINAL) {

                for (int i=0;i<150000;i++) {
                    WRITE_REG (VGA_ADDR, addr_reg);
                    WRITE_REG (VGA_DATA, (0 + '0'));
                    // for (int j=0;j<1;j++) {}
                    // WRITE_REG (VGA_ADDR, addr_reg2);
                    // WRITE_REG (VGA_DATA, (1 + '0'));
                    // for (int k=0;k<1;k++) {}
                }  
                column = column + COLUMN_OFFSET;
                addr_reg = (addr_reg & ~COLUMN_MASK) | (column);
                addr_reg2 = (addr_reg & ~COLUMN_MASK) | (column+10);
            }
            row = row + ROW_OFFSET;  
            addr_reg = (addr_reg & ~ROW_MASK) | (row << 10);
        }
    }

    return(0);
}