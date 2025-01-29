/*
Author: Christine Mier
Email: cmier@csu.fullerton.edu
Course/Section: CPSC240-17 Final Program
Date: Dec-17-2024
*/
#include<stdio.h>
#include<stdlib.h>
#include <math.h>

extern long int manager();

int main(int argc, const char *argv[]) {
    printf("Welcome to the harmonic summation program.\nBrought to you by Christine Mier.\n");
    long int result = manager();
    printf("The driver has received this number %ld and will keep it.\n", result);
    printf("Main will return 0 to the operating system. Bye.\n");
}