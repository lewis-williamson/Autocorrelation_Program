function [] =run_measurement()
%function takes two measurment and uses the slow axis (backwards) to
%actuate the stage movement (twice) between the measurements the stage
%position is then reset using the forward direction

global S
cla(S.graph1)
cla(S.graph2)

global center_x_1
global center_x_2
global width1
global width2

[X1,Y1] = ReadWaveform('channel1');
[width1, center_x_1,center_y_1, Yfit1]=fwhm(X1,Y1);
Speak('waveform 1 acquired',S.Clippy);
axes(S.graph1);
plot(X1,Y1)%,S.graph1)
hold(S.graph1,'on');
scatter( center_x_1,center_y_1);
plot(X1,Yfit1);

pause(1)

Jog('Backwards');
Jog('Backwards');

[X2,Y2] = ReadWaveform('channel1');
[width2, center_x_2,center_y_2, Yfit2]=fwhm(X2,Y2);
Speak('waveform 2 acquired',S.Clippy);
axes(S.graph2);
plot(X2,Y2);
hold(S.graph2,'on');
scatter( center_x_2,center_y_2);
plot(X1,Yfit2);
disp(width2)
disp(append('fucking hell',num2str(width1)))
pause(1)

calculations(center_x_1,center_x_2,width1,width2);

Jog('Forwards');

disp(append('fucking hell',num2str(abs(center_x_1-center_x_2))))


end 
    
function [X2,Y2, width2, center2, roots2, Yfit2]=measure_again()
        [X2,Y2] = ReadWaveform('channel1');
        [width2, center2, roots2, Yfit2]=fwhm(X2,Y2);
        Speak('waveform2 acquired',S.Text_for_display);
        plotslow(X2,Y2,S.graph2);
end 
