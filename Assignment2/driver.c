/*****************************************************************************************************************************
Program name: "Assignment 2, Average Driving Time". This program demonstrates user input and output                       *
Copyright (C) 2024  Christine Mier                                                                                         *
This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
version 3 as published by the Free Software Foundation.                                                                    *
This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                           *
****************************************************************************************************************************
*/

/*========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**
Author information
  Author name: Christine Mier
  Author email: cmier@csu.fullerton.edu

Program information
 Program name: Assignment 2, Average Driving Time
  Programming languages X86 with one module in C
  Date development of version 1 began 2024-Sept-21
  Date development of version 1 completed 2024-Sept-25

Purpose
  This program calculate the average driving time, speed, and total distance of a trip. It is meant to demonstrate how to use arithmetic in x86.

Project information
  Files: driver.c, average.asm, isfloat.asm,  run.sh
  Status: The program has been tested extensively with errors which inclue: failure to remove newline characters, incorrect calculations, and failure to return average speed to driver.c.

Translator information
  Linux: gcc -c -Wall -m64 -no-pie -o driver.o driver.c -std=c11

References and credits
   Holliday, 'Isfloat.asm'

Format information
  Page width: 172 columns
  Begin comments: 61
  Optimal print specification: Landscape, 7 points, monospace, 8Â½x11 paper

===== Begin code area ====================================================================================================================================================
*/

#include<stdio.h>
#include<stdlib.h>

extern long int driver();

int main(){
    long int number = -999;
    printf("Welcome to 'Average Driving Time' maintained by Christine Mier.\n");
    number = driver();
    printf("The driver has received this number %ld.10 and will keep it for future use. Have a great day!\n", number);
    printf("An integer zero will now be sent to the operating system. Bye!\n");

    return 0;
}