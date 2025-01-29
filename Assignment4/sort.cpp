/***************************************************************************************************************************
Program name: "Assignment 4, Non-Deterministic Random Numbers". This program generates random IEEE754 numbers and displays *
their scientific decimal form, as well as sorts and displays the array of random numbers.                                  *
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
 Program name: Assignment 4, Non-Deterministic Random Numbers
  Programming languages X86 with two modules in C++
  Date development of version 1 began 2024-Oct-22
  Date development of version 1 completed 2024-Nov-03

Purpose
  This program generates random IEEE754 numbers and displays their scientific decimal form as well as sorts and displays the array of random numbers.

Project information
  Files: main.cpp, executive.asm, fill_random_array.asm, show_array.asm, normalize_array.asm, isnan.asm, sort.cpp, run.sh
  Status: The program has been tested extensively with no detectable errors. However, it does not normalize the array and sorts/prints the normalized array.
Translator information
  Linux: gcc -c -Wall -m64 -no-pie -o sort.o sort.cpp

References and credits
 Holliday

Format information
  Page width: 172 columns
  Begin comments: 61
  Optimal print specification: Landscape, 7 points, monospace, 8Â½x11 paper

===== Begin code area ====================================================================================================================================================*/

#include <stdio.h>
#include <math.h>

using namespace std;

extern "C" void sort(double array[], int array_size);

/**
 * define function compute_variance with:
 * @param double array[]: the array that contains the numbers inserted by the user
 * @param int array_size: the number of elements contained in the array
 * @return a double of the computed variance using the formula for variance
 * */ 

void sort(double array[], int array_size)
{
    double temp;
    for (int i = 0; i < array_size; ++i)
    {
        for (int j = 0; j < array_size - i - 1; ++j)
        {
            if (array[j] > array[j + 1])
            {
                temp = array[j];
                array[j] = array[j + 1];
                array[j + 1] = temp;
            }
        }
    }
}