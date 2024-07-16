function [FWHM]=calculations(difference,width,movement,c,k) 
                    
                   movement_t=(2*movement)/c;               %realtime dealy induced by moving delay stage  
                   m_s=movement_t/difference;               %data points per second  
                                                            %max amount of time on measurment using difference as the base 
                   FWHM=(m_s*width);                       %FWHM without k                            
                   
        end