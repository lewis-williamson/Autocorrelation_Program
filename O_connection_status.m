function [groupObj,deviceObj] =O_connection_status
%FUNCTION THAT PREFORMS TWO TASKS: connects IF NOT(!) already done so and
%returns the required handles for commincation with the scope
    interfaceObj = instrfind('Type', 'visa-usb', 'RsrcName', 'USB0::0x0699::0x03AA::C013099::0::INSTR', 'Tag', '');
    deviceObj = icdevice('tektronix_tds2024.mdd', interfaceObj);
    display(append('connecting to ',deviceObj.Name));
        groupObj=get(deviceObj,'System');
    try 
       selftest(deviceObj)             %returns an error if not connected if not 
        
    catch
        connect(deviceObj)
    end 
        display('Oscilloscope Connected'); 
    groupObj=get(deviceObj,'System');
end