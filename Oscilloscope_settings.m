function []= Oscilloscope_settings(S)

%this function will configure the actual connection with the oscilloscope, call on the structure and control the ability of the O.GUI
O = Oscilloscope_Structure;

set([O.pb1,O.pb2,O.pb3,O.pb4,O.pb5],'callback',{@run_Oscilloscope,O});
Speak('no connection',O.Conntext);
Speak('this',S.OStatus)
    function []=run_Oscilloscope(varargin)     
        
        if varargin{1}==O.pb1 
                str = get(O.pb1,{'str','value'});
                
                switch str{1}{str{2}}                               % a very stupid way of determining what button is pressed
                    case 'USB0::0x0699::0x03AA::C013099::0::INSTR'
                   Speak('Retrieving Device List ',O.text)
                            
                            interfaceObj = instrfind('Type', 'visa-usb', 'RsrcName', 'USB0::0x0699::0x03AA::C013099::0::INSTR', 'Tag', '');
 
                                % Create the VISA-USB object if it does not exist
                                % otherwise use the object that was found.
                        
                            if isempty(interfaceObj)
                                interfaceObj = visa('NI', 'USB0::0x0699::0x03AA::C013099::0::INSTR');
                            else
                                fclose(interfaceObj);
                                interfaceObj = interfaceObj(1);
                            end
 
                                % Create a device object. 
                            
                                deviceObj = icdevice('tektronix_tds2024.mdd', interfaceObj);
                               % Speak('connected to the oscilloscope',O.text)
                                Speak('connected to Oscilloscope',O.Conntext);
                                Speak('',O.text)
                    case 'Select Oscilloscope'
                        Speak('This is not an option',O.text)
                        
                end         
        end 

        if varargin{1}==O.pb2              
               str2 = get(O.pb2,{'str','value'});
                Speak('Press "Upload to Oscilloscope"',O.text)
        end 
         if varargin{1}==O.pb3              
                Speak('',O.text);
                Speak('Pressing Button 3 does this',O.text);      
        end      
        if varargin{1}==O.pb4 
            str2 = get(O.pb2,{'str','value'});
            [groupObj,deviceObj] =connection_status
                 switch str2{1}{str2{2}} 
                    case 'Timebase 1'
                        invoke(groupObj, 'loadstate',1) 
                    case 'Timebase 2'
                        invoke(groupObj, 'loadstate',2) 
                    case 'Timebase 3'
                        invoke(groupObj, 'loadstate',3) 
                 end
        end
        if varargin{1}==O.pb5  
                [groupObj,deviceObj] =connection_status;
                 str2 = get(O.pb2,{'str','value'});
                get2 = get(deviceObj.Acquisition(1), 'Timebase');   
                get3 = get(deviceObj.Acquisition(1), 'State');
                get4 = get(deviceObj.Acquisition(1), 'Mode');
                get5 = get(deviceObj.Acquisition(1), 'Delay');
                get6 = get(deviceObj.Acquisition(1), 'Control');
                get7 = get(deviceObj.Calibration(1), 'Status');
                gett2=string(get2) %convert whatevver to string
                
  statusO=append(append('Settings State=',string(str2{2}),'                                      '),...
                append('Timebase= ',string(get2*1000),'ms                                       '),...
                append('State= ',string(get3),'                                                 '),...
                append('Mode= ',string(get4),'                                                  '),...
                append('Delay= ',string(get5),'s                                                '),...
                append('Control= ',string(get6),'                                               '),...
                append('Status= ',string(get7),'                                                '))

  statusS=append(append('Settings State=',string(str2{2}),'                                      '),...
                append('Timebase= ',string(get2*1000),'ms                                       '),...
                append('Delay= ',string(get5),'s                                                '),...
                append('Status= ',string(get7),'                                                '))
                

                Speak(statusO,O.text);      
                Speak(statusS,S.OStatus)

        end
        
    end 
end