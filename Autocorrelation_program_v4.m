%TODO; 
%sort file path, currently the last file path is presented with pressing the new path button. ideally this would be the last path minus one '/'
%fix the overflowwing current path box this isnt the best presentation 

function [] = GUI_v3() 
    %% import selections for timbase
    format long 
    k1=1.543;                                           
    k2=1.414                                            
    c=3E8;                                              
    movement=6.65967E-5                              
                                                         
    close all
    %% Setting Frame (global 'S') 

    global S;

    S = Structure;
     
    
    set([S.pb1,S.pb2,S.pb3,S.pb4,S.pb5,S.pb6,S.pb7,S.pb8,S.pb9,S.pb10],'callback',{@run_Program,S});



%% Running Function Start
        function []=run_Program(varargin)

            global channelsEnums
            global jogDirectionEnums
            global device
            global timeout_val

        %% Plot Data
            num=0;
            path='';
                    if varargin{1}==S.pb1
                        Oscilloscope_settings();
                    end 
        %%  Run Measurement       
        
            if varargin{1}==S.pb2
        run_measurement;

                                                                                                                                          %             % [widthB,centerB,rootsB,YfitB]=  fwhm(t',file_1);   %center the peak value position, roots the fwhm points

                           % [widthA,centerA,rootsA,YfitA]=fwhm(t',file_0);   %width=fwhm in terms of raw data t.
                            % [widthB,centerB,rootsB,YfitB]=  fwhm(t',file_1);   %center the peak value position, roots the fwhm points

                            % [widthC,centerC,rootsC,YfitC]=  fwhm(t',file_2);   %fit the gaussian fit 
                            % 
                            % difference_t=                   abs(t(centerA)-t(centerC));         %time difference between the two centeres 
                            % difference_t_2=                 abs(t(centerB)-t(centerC));
                            % difference_t_2=                 abs(t(centerA)-t(centerB));
                            % 
                            % [FWHMA]=                        calculations(difference_t,widthA,movement,c,k1);  % this function then calculates the real fwhm 
                            % [FWHMB]=                        calculations(difference_t,widthB,movement,c,k1);  %difference is the data size between the two peaks
                            % [FWHMC]=                        calculations(difference_t,widthC,movement,c,k1);    
                            % 
                            % 
                            % Result1=                        (FWHMA/1E-15);
                            % Result2=                        (FWHMB/1E-15);
                            % Result3=                        (FWHMC/1E-15);
                            % Average=                        (Result1+Result2+Result3)/3
                            % difference=                     t(centerA)-t(centerB);
                            % peak=num2str(peakA);
                            % 
                            %                                 Speak(append('these are the results from the three measurements + the average:                                                    '...' ...
                            %                                     ,num2str(round(Result1,1)),'fs','                                                    '...
                            %                                         ,num2str(round(Result2,1)),'fs','                                                    '...
                            %                                         ,num2str(round(Result3,1)),'fs','                                                    '...
                            %                                         ,num2str(round(Average,2)),'fs'),S.Text_for_display);
                                                            % Speak(append(num2str(round(widthA,1)),'                                                    '...
                                                            %             ,num2str(round(widthB,1)),'                                                    '...
                                                            %             ,num2str(round(widthC,1)),'                                                    '...
                                                            %             ,num2str(round(Average,1)), ...
                                                            %             num2str(peak)),S.Text_for_display);
                                                            
                                                             % clipboard('copy',append(num2str(round(Result1,1)),' ',num2str(round(Result2,1)),' '...
                                                             %    ,num2str(round(Result3,1))));
                                                           % clipboard('copy',append(num2str(round(widthA,1)),' ',num2str(round(widthB,1)),' '...
                                                           % ,num2str(round(widthC,1))))
                            
                end
        
        %% reset 
                if varargin{1}==S.pb3;
                            Speak('',S.Clippy);
                            plotslow(0,0,S.graph1);
                            plotslow(0,0,S.graph2);
                          
                            plotslow(0,0,S.graph4);
                            Speak('',S.OStatus);
                end;
        
        %% STAGE SETTINGS
                if varargin{1}==S.pb4
                             Stage_settings();
                end 
        %%  age of data
                if varargin{1}==S.pb5
                            Speak(Age,S.Clippy);
                end  
        %% Help 
                if varargin{1}==S.pb6
                            ran=round(rand*10);
                            Speak(Help_Text(ran),S.Clippy);
                end
        %% RUN BUTTON
                if varargin{1}==S.pb7
                           run_measurement;
                end 
        %% SAVE BUTTON?
                if varargin{1}==S.pb8
                           Save
                end 
            
                if varargin{1}==S.pb9
                            Jog('Forwards');
                end 

                if varargin{1}==S.pb10
                            Jog('Backwards');
                end 
               
        end 
end