/***************************************************************************************************************************
Program name: "Assignment3, The Arrays Program". This program demonstrates the use of user input into an array and         *
getting the sum of an array as well as sorting it using Assembly, C, and C++.                                              *
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
 Program name: Assignment 3, The Array Program
  Programming languages X86 with one module in C++ and one module in C
  Date development of version 1 began 2024-Oct-04
  Date development of version 1 completed 2024-Oct-13

Purpose
  This program is a 'Array' program which demonstrates the use of user input into an array and getting the sum of an array as well as sorting it using Assembly, C, and C++.

Project information
  Files: main.c, manager.asm, input_array.asm, isinteger.asm, output_array.asm, sum.asm, sort.cpp, run.sh
  Status: The program has been tested extensively with no detectable errors. However, it does not print output of array correctly and does not call for sum of array correctly
Translator information
  Linux: gcc -c -Wall -m64 -no-pie -o main.o main.c -std=c11

References and credits
 Holliday

Format information
  Page width: 172 columns
  Begin comments: 61
  Optimal print specification: Landscape, 7 points, monospace, 8Â½x11 paper

===== Begin code area ====================================================================================================================================================
*/

#include<stdio.h>
#include<stdlib.h>
#include <math.h>

extern char *manager();

int main(int argc, const char *argv[]) {
    char *username;
    printf("Welcome to Marvelous Arrayss.\nBrought to you by Christine Mier.\n");
    username = manager();
    printf("\nI hope you liked your arrays %s\n", username);
    printf("Main will return 0 to the operating system. Bye.\n");
}