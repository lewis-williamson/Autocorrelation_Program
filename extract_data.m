function [t,Age,file_0,file_1,file_2,new_num,path,peakA,peakB,peakC]=extract_data(num,path)
                
                if num==0
                    selpath = uigetdir;                     %opens window to select the desired path
                else            
                    selpath = uigetdir(path);               %this will import the desired path as a string(?) and will be used for determining the location of the dfiles that are goipng to b used
                end 
                new_num=num+1
                    
                loc0=append(selpath,'/File0.txt');          %file 1 path. 
                loc1=append(selpath,'/File1.txt');
                loc2=append(selpath,'/File2.txt');
               
                %% Load Data
                opts = delimitedTextImportOptions("NumVariables", 2);   %options for importing data, generated by matlab when importing, reading just the y values 
                opts.DataLines = [5, Inf];
                opts.Delimiter = "\t";
                opts.VariableNames = ["Var1", "VarName2"];
                opts.SelectedVariableNames = "VarName2";
                opts.VariableTypes = ["string", "double"];
                opts.ExtraColumnsRule = "ignore";
                opts.EmptyLineRule = "read";
                opts = setvaropts(opts, "Var1", "WhitespaceRule", "preserve");
                opts = setvaropts(opts, "Var1", "EmptyFieldRule", "auto");
                
                file_0 = table2array(readtable(loc0, opts));
                file_1 = table2array(readtable(loc1, opts));
                file_2 = table2array(readtable(loc2, opts));

                peakA=max(file_0);
                peakB=max(file_1);
                peakC=max(file_2);
                
                file_0=file_0/max(file_0);
                file_1=file_1/max(file_1);
                file_2=file_2/max(file_2);
                % time base + age:
                Age=dir(loc0).date;
                t=1:length(file_0);
                path=selpath;
end