function [X,Y] = ReadWaveform(channel)
global deviceObj
groupObj=get(deviceObj,'waveform');
[Y,X] = invoke(groupObj,'readwaveform','channel1'); %optional to add units using - [y,x,yunits,xunits]=...
end