function [] =run_measurement()
global S
cla(S.graph1)
cla(S.graph2)
[X1,Y1] = ReadWaveform('channel1');
[width1, center_x_1,center_y_1, Yfit1]=fwhm(X1,Y1);
Speak('waveform 1 acquired',S.Clippy);
axes(S.graph1);
plot(X1,Y1)%,S.graph1)
hold(S.graph1,'on')
scatter( center_x_1,center_y_1);
plot(X1,Yfit1)

% if j==0                                                 %J is some quantification of where the pulse is and 
%                                                         % determines if the stage needs to be moved backwards or forwards
%         Jog('Backwards')
%     elseif j==1
%         Jog('Forwards')
% end

%[X2, Y2, width2, center2, Yfit2]=measure_again;     %take a second measurement after moving the stage
    
[X2,Y2] = ReadWaveform('channel1');
[width2, center_x_2,center_y_2, Yfit2]=fwhm(X2,Y2);
Speak('waveform 2 acquired',S.Clippy);
axes(S.graph2);
hold(S.graph2,'on')
plot(X2,Y2)%,S.graph1);
scatter( center_x_2,center_y_2);

% if abs(center2-center1)<Condition
%     if j==0
%         Jog('Backwards')
%     elseif j==1
%         Jog('forwards')
%     end

%     [X2, Y2, width2, center2, Yfit2]=measure_again
% 
% else 
% end 
end 
    
function [X2,Y2, width2, center2, roots2, Yfit2]=measure_again()
        [X2,Y2] = ReadWaveform('channel1');
        [width2, center2, roots2, Yfit2]=fwhm(X2,Y2);
        Speak('waveform2 acquired',S.Text_for_display);
        plotslow(X2,Y2,S.graph2);
end 
