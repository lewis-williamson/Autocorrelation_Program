function    []= Stage_settings(S)

S= S_Structure;
set([S.pb1,S.pb2,S.pb3,S.pb4,S.pb5],'callback',{@run_stage,S});
    
    function []=run_stage(varargin)
   serial_num='97101961';

        n=0;

        if varargin{1}==S.pb1                                   %button for selecting the timebase
               str2 = get(S.pb2,{'str','value'});
       
                switch str2{1}
                        
                    case '97101961'
               
                        [device,channelsEnums,jogDirectionEnums,timeout_val]=Stage_connection(serial_num,n);
                        n=1
                        

                end
        end 

    end
end