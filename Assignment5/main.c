/***************************************************************************************************************************
Program name: "Assignment 5, Execution Speed". This program calculated the execution time of a taylor series.              *
Copyright (C) 2024  Christine Mier                                                                                         *
This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
version 3 as published by the Free Software Foundation.                                                                    *
This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                           *
****************************************************************************************************************************



========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**
Author information
  Author name: Christine Mier
  Author email: cmier@csu.fullerton.edu

Program information
 Program name: Assignment 5, Execution Speed
  Programming languages X86 with one module in C
  Date development of version 1 began 2024-Nov-13
  Date development of version 1 completed 2024-Nov-26

Purpose
  This file serves as the main file for the "Execution Speed" program which returns the result found in the taylor.asm file
Project information
  Files: main.c, series.asm, taylor.asm, r.sh
  Status: The program has been tested extensively with no detectable errors.
Translator information
    Linux: gcc -c -Wall -m64 -no-pie -o main.o main.c -std=c11

References and credits

Format information
  Page width: 172 columns
  Begin comments: 61
  Optimal print specification: Landscape, 7 points, monospace, 8Â½x11 paper

===== Begin code area ====================================================================================================================================================*/

#include<stdio.h>
#include<stdlib.h>

extern double series();

int main(int argc, const char *argv[]){
    double number = 0;
    printf("Welcome to 'Taylor Series' by Christine Mier.\n");
    number = series();
    printf("The driver has received this number %.10lf and will keep it.\n", number);
    printf("Goodbye!\n");

    return 0;
}