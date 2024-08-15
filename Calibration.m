%script aimed to determine the calibration of ape with the autocorrelator

c=3E8;
k=1.54;

width1 = 0.0043065378;        %average of position 6
width2 = 0.004261;
difference =0.0677;

ape_measurement = 126E-15

width_ape = ape_measurement*k;

d_m=width_ape/width2; %returns a number for the real bits/m

difference_real = d_m*difference*3E8

