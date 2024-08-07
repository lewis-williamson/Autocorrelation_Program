function [FWHM]=calculations(center_x_1,center_x_2,width1,width2) 
    global S
    c=3E8;
    k=1.54;
    
    diff = abs(center_x_1-center_x_2)        %digital distnance of the peaks
    m_s=(( 6.621550241999567e-04)/c)/diff
                                                                %max amount of time on measurment using difference as the base 
    FWHM1=(m_s*width1)/k;                       %FWHM without k 
    FWHM2=(m_s*width2)/k; 
    
    fwhm1=append('fhwm1=',num2str(round((FWHM1/1E-15),2)),'fs');
    fwhm2=append('fhwm2=',num2str(round((FWHM2/1E-15),2)),'fs');;
    Speak(append(fwhm1,'        ',fwhm2),S.Clippy);
end