function []=Jog(direction)

global channelsEnums
global jogDirectionEnums
global device
global timeout_val

device.StartPolling(1000);
timeout_val=600000

    if strcmp(direction,'Forwards')==1
        disp('Direction of movement forwards');
        device.Jog(channelsEnums.GetValue(0), jogDirectionEnums.GetValue(0), timeout_val);       %jog direction 1=backwards 0=forwards
    elseif strcmp(direction,'Backwards')==1
        disp('Direction of movement anti-forwards');
        device.Jog(channelsEnums.GetValue(0), jogDirectionEnums.GetValue(1), timeout_val);       %jog direction 1=backwards 0=forwards
    else 
        disp('ya put something in wrong');
end