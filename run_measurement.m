function [] =run_measurement()
global S

[X1,Y1] = ReadWaveform('channel1');
Speak('waveform1 acquired',S.Text_for_display);
plotslow(X1,Y1,S.graph1);
pause(4)

[X2,Y2] = ReadWaveform('channel1');
Speak('waveform2 acquired',S.Text_for_display);
plotslow(X2,Y2,S.graph2);

end