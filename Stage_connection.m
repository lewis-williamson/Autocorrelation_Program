function []=Stage_connection(serial_num,n)

%both check connection and if not connected then connect to the stage
%check if device is connected
if n==0 
      % selftest(device)             %returns an error if not connected if not if has gone through initalisation thent this will skip
       [device,channelsEnums,jogDirectionEnums,timeout_val]=run_connection
       
else
        
end 