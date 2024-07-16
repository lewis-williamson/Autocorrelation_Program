function [device,channelsEnums,jogDirectionEnums,timeout_val]=Stage_connection(serial_num)
%both check connection and if not connected then connect to the stage

%check if device is connected

 try 
       selftest(deviceObj)             %returns an error if not connected if not 
        
    catch
        connect(deviceObj)
    end 

devCLI = NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.DeviceManagerCLI.dll');
genCLI = NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.GenericMotorCLI.dll');
motCLI = NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.KCube.InertialMotorCLI.dll');

import Thorlabs.MotionControl.DeviceManagerCLI.*
import Thorlabs.MotionControl.GenericMotorCLI.*
import Thorlabs.MotionControl.KCube.InertialMotorCLI.*

%% Create Simulation (Comment out for real device)
% 

%% Connect
% Builds Device list
DeviceManagerCLI.BuildDeviceList();

% Will need to update serial number to correct device
serial_num='97101961';
timeout_val=60000;

%Connect to controller
device = KCubeInertialMotor.CreateKCubeInertialMotor(serial_num);
device.Connect(serial_num);
device.WaitForSettingsInitialized(5000);

device.StartPolling(250);
device.EnableDevice();
pause(1) %wait to make sure device is enabled
devCLI = NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.DeviceManagerCLI.dll');
genCLI = NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.GenericMotorCLI.dll');
motCLI = NET.addAssembly('C:\Program Files\Thorlabs\Kinesis\Thorlabs.MotionControl.KCube.InertialMotorCLI.dll');

import Thorlabs.MotionControl.DeviceManagerCLI.*
import Thorlabs.MotionControl.GenericMotorCLI.*
import Thorlabs.MotionControl.KCube.InertialMotorCLI.*

%% Create Simulation (Comment out for real device)
% 

%% Connect
% Builds Device list
DeviceManagerCLI.BuildDeviceList();

% Will need to update serial number to correct device
serial_num='97101961';
timeout_val=60000;

%Connect to controller
device = KCubeInertialMotor.CreateKCubeInertialMotor(serial_num);
%device.Connect(serial_num);
device.WaitForSettingsInitialized(5000);

device.StartPolling(250);
device.EnableDevice();
pause(1) %wait to make sure device is enabled

% Pull the Enums needed
channelsHandle = motCLI.AssemblyHandle.GetType('Thorlabs.MotionControl.KCube.InertialMotorCLI.InertialMotorStatus+MotorChannels');

channelsEnums = channelsHandle.GetEnumValues();
jogDirectionHandle = motCLI.AssemblyHandle.GetType('Thorlabs.MotionControl.KCube.InertialMotorCLI.InertialMotorJogDirection');
jogDirectionEnums = jogDirectionHandle.GetEnumValues();

% Zero the actuator
fprintf("Zero the actuator\n")
device.SetPositionAs(channelsEnums.GetValue(0), 0);
device.Jog(channelsEnums.GetValue(0), jogDirectionEnums.GetValue(0), timeout_val);
% Pull the Enums needed
channelsHandle = motCLI.AssemblyHandle.GetType('Thorlabs.MotionControl.KCube.InertialMotorCLI.InertialMotorStatus+MotorChannels');

channelsEnums = channelsHandle.GetEnumValues();
jogDirectionHandle = motCLI.AssemblyHandle.GetType('Thorlabs.MotionControl.KCube.InertialMotorCLI.InertialMotorJogDirection');
jogDirectionEnums = jogDirectionHandle.GetEnumValues();

% Zero the actuator
fprintf("Zero the actuator\n")
device.SetPositionAs(channelsEnums.GetValue(0), 0);
device.Jog(channelsEnums.GetValue(0), jogDirectionEnums.GetValue(0), timeout_val);
end