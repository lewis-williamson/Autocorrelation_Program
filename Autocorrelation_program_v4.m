%TODO; 
%sort file path, currently the last file path is presented with pressing the new path button. ideally this would be the last path minus one '/'
%fix the overflowwing current path box this isnt the best presentation 

function [] = GUI_v3() 
    %% import selections for timbase
    format long 
    k1=1.543;                                           %pulse shape factor Sech^2
    k2=1.414                                            %de convolution factor for gaussian pulses
    c=3E8;                                              %speed of light 
    movement=   6.65967E-5                              %50 steps 'backwards'500s/s 1ksteps/s^2 
                                                        %movement of the stage between every measurement 
    close all
    t=[0];
    Age='';
    file_0=[];
    file_1=[];
    file_2=[];
    num=0;
    path='';
    peakA=[];
    peakB=[];
    peakC=[];
    %% Setting Frame (global 'S') 
    S = Structure;
    num=0;                      %cannot remember what this is for
    path='';                    
    
    set([S.pb1,S.pb2,S.pb3,S.pb4,S.pb5,S.pb6,S.pb7,S.pb8],'callback',{@run_Program,S});



%% Running Function Start
        function []=run_Program(varargin)
        %% Plot Data
        num=0;
        path='';
                if varargin{1}==S.pb1
                            plotslow(t,file_0,S.graph1);
                            plotslow(t,file_1,S.graph2);
                            plotslow(t,file_2,S.graph3);
        
                end 
        %%  Run Measurement       
        
        if varargin{1}==S.pb2
        
                                                                                                                                            [widthA,centerA,rootsA,YfitA]=fwhm(t',file_0);   %width=fwhm in terms of raw data t.
                            [widthB,centerB,rootsB,YfitB]=  fwhm(t',file_1);   %center the peak value position, roots the fwhm points
                            [widthC,centerC,rootsC,YfitC]=  fwhm(t',file_2);   %fit the gaussian fit 
                          
                            difference_t=                   abs(t(centerA)-t(centerC));         %time difference between the two centeres 
                            difference_t_2=                 abs(t(centerB)-t(centerC));
                            difference_t_2=                 abs(t(centerA)-t(centerB));
                        
                            [FWHMA]=                        calculations(difference_t,widthA,movement,c,k1);  % this function then calculates the real fwhm 
                            [FWHMB]=                        calculations(difference_t,widthB,movement,c,k1);  %difference is the data size between the two peaks
                            [FWHMC]=                        calculations(difference_t,widthC,movement,c,k1);    
                 
                           
                            Result1=                        (FWHMA/1E-15);
                            Result2=                        (FWHMB/1E-15);
                            Result3=                        (FWHMC/1E-15);
                            Average=                        (Result1+Result2+Result3)/3
                            difference=                     t(centerA)-t(centerB);
                            peak=num2str(peakA);
                            
                                                            Speak(append('these are the results from the three measurements + the average:                                                    '...' ...
                                                                ,num2str(round(Result1,1)),'fs','                                                    '...
                                                                    ,num2str(round(Result2,1)),'fs','                                                    '...
                                                                    ,num2str(round(Result3,1)),'fs','                                                    '...
                                                                    ,num2str(round(Average,2)),'fs'),S.Text_for_display);
                                                            % Speak(append(num2str(round(widthA,1)),'                                                    '...
                                                            %             ,num2str(round(widthB,1)),'                                                    '...
                                                            %             ,num2str(round(widthC,1)),'                                                    '...
                                                            %             ,num2str(round(Average,1)), ...
                                                            %             num2str(peak)),S.Text_for_display);
                                                            
                                                             clipboard('copy',append(num2str(round(Result1,1)),' ',num2str(round(Result2,1)),' '...
                                                                ,num2str(round(Result3,1))));
                                                           % clipboard('copy',append(num2str(round(widthA,1)),' ',num2str(round(widthB,1)),' '...
                                                           % ,num2str(round(widthC,1))))
                            
                end
        
        %% reset 
                if varargin{1}==S.pb3;
                            Speak('',S.Text_for_display);
                            plotslow(0,0,S.graph1);
                            plotslow(0,0,S.graph2);
                          
                            plotslow(0,0,S.graph4);
                            Speak('',S.OStatus);
                end;
        
        %% Gaussian / sech pulse 
                if varargin{1}==S.pb4
                            O_Structure;
                end 
        %%  age of data
                if varargin{1}==S.pb5
                            Speak(Age,S.Text_for_display);
                end  
        %% Help 
                if varargin{1}==S.pb6
                            ran=round(rand*10);
                            Speak(Select_Speak(ran),S.Text_for_display);
                end
        %% Oscilloscope Settings
                if varargin{1}==S.pb7
                           Oscilloscope_settings(S);
                end 
        %% Stage Settings
                if varargin{1}==S.pb8
                           Stage_settings(S);
                end 
            
        end 
end