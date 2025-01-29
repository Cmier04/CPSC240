/*
Author: Christine Mier
Email: cmier@csu.fullerton.edu
Course/Section: CPSC240-17
Date: Dec-17-2024
*/

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