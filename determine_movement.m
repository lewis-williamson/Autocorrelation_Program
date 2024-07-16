close all ;
clear all 
clc
%code for determining the value for the pieso stage movement on the inline autocorrelator.
%input the widht of the pulses (avergae) and then the distance between them?
width=0.00224232;
delta_t=2.000000000000000e-05;
t=(delta_t*(1:2500));
diff=0.003414;
c=3E8;
k=1.5430;
ds_diff=2.149400000000000e-04;
sd_width=4.000000000000000e-05;
movement=linspace(0,10E-5,10000);
for i=1:length(movement)
    [fwhm(i)]=calculations(diff,width,movement(i),c,k);
end 

plot(movement,fwhm);

[value loc]=min(abs(fwhm-(189*1E-15)))

plot(movement,fwhm);
ylabel('FWHM (fs)')
xlabel('DELAY distance (m)')  
hold on
scatter(movement(loc),fwhm(loc));
hold off
print(num2str(movement(loc)))
