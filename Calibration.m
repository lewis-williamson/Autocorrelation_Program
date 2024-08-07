%script aimed to determine the calibration of ape with the autocorrelator

c=3E8;
k=1.54;

width1 = 0.0096901;
width2 = 0.0093065378;
difference = 0.0586;

ape_measurement = 237E-15

width_ape = ape_measurement*k;

d_m=width_ape/width1; %returns a number for the real bits/m

difference_real = d_m*difference*3E8

