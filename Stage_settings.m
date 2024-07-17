function    [device,channelsEnums,jogDirectionEnums,timeout_val]= Stage_settings()

Ss=Ss_Structure;
set([Ss.pb1,Ss.pb2,Ss.pb3,Ss.pb4,Ss.pb5],'callback',{@run_stage,Ss});
n=0;
device=[];
channelsEnums=[];
jogDirectionEnums=[];
timeout_val=[];

    function [device,channelsEnums,jogDirectionEnums,timeout_val]=run_stage(varargin)
        
        serial_num='97101961';

            if varargin{1}==Ss.pb1                                   %button for selecting the timebase
            
                str2 = get(Ss.pb1,{'str','value'});
                
                     switch str2{2}
                        
                        case 2
                            if n==0
                                 Speak('connecting',Ss.text)
                                [device,channelsEnums,jogDirectionEnums,timeout_val]=Stage_connection(serial_num,n);
                                n=1
                                Speak('',Ss.text)
                                Speak('connected',Ss.connection_status)
                                Speak('',Ss.text)
                             else
                                 Speak('already connected',Ss.connection_status)
                                 Speak()
                            end
                     end
            end 

    end
end