function [device,channelsEnums,jogDirectionEnums,timeout_val]=Stage_connection(serial_num,n,device)
%both check connection and if not connected then connect to the stage

%check if device is connected
if n~=0
 try 
       selftest(device)             %returns an error if not connected if not if has gone through initalisation thent this will skip
       [device,channelsEnums,jogDirectionEnums,timeout_val]=run_connection
 catch
        
        connect(device);
 end 
else
    
end

    
end 