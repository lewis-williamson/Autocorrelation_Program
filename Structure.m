function S = Structure

%constants for arrangement
gap = 0.01;
box_height=0.08
button_size = [0 0 0.17 box_height];
rawboxheight=0.91-box_height-0.01
rawdatawidth=0.47
status_box_width=(rawdatawidth-gap)/2;

%% set main window
S.fh =              figure('units','normalized',...              %create box dimensions 
                        'position',[0.0 0.3 0.5 0.65],...
                        'menubar','none',...
                        'name','Autocorrelator gui',...
                        'numbertitle','off',...
                        'resize','on',...
                        'deletefcn','');     
%% Geometrics 


 S.rec_1=annotation('Parent',S.fh,'rectangle',[gap 0.2 rawdatawidth 0.7],'linewidth',2);

%% headers

S.raw_text_header=  annotation('Parent',S.fh,'textbox',[gap rawboxheight rawdatawidth box_height],...%raw data
                        'String',{'Raw Data'},'linewidth',2,'HorizontalAlignment','center','VerticalAlignment','middle','FontSize',30,'FitBoxToText','off','BackgroundColor','#fdad00');

S.Text_Header=      annotation('Parent',S.fh,'textbox',[gap 0.91 0.98 box_height],'String',['Pulse Duration Measurement'],'linewidth',3,... %title
                        'HorizontalAlignment','center','VerticalAlignment','middle','FontSize',30,'FitBoxToText','off','BackgroundColor','#fdad00');

S.OStatus_header=   annotation('Parent',S.fh,'textbox',...                                         %
                        [gap 0.15 status_box_width 0.04],'linewidth',2,... %oscilloscope status title
                        'HorizontalAlignment','center','VerticalAlignment','middle','string',{'Oscilloscope Status'},'FontSize',14,'FitBoxToText','off','BackgroundColor','#fdad00');

S.SStatus_header=   annotation('Parent',S.fh,'textbox',...                                         %
                        [0.25 0.15 status_box_width 0.04],'linewidth',2,... %stage status tile
                        'HorizontalAlignment','center','VerticalAlignment','middle','string',{'Stage Status'},'FontSize',14,'FitBoxToText','off','BackgroundColor','#fdad00');

%% Active Text Boxes
S.Text_for_display= annotation('Parent',S.fh,'textbox',...                                       %clippy's speech 
                        [0.500755381768377 0.109375 0.34206640040984 0.224838576876407],...
                        'String','','LineStyle','none', ...
                        'FontSize',14,'FontName','Comic Sans MS','FitBoxToText','off');

S.OStatus=          annotation('Parent',S.fh,'textbox',[gap gap status_box_width 0.14],'linewidth',2,...
                        'HorizontalAlignment','center','FontSize',20,'FitBoxToText','off');

S.SStatus=          annotation('Parent',S.fh,'textbox',[0.25 gap status_box_width 0.14],'linewidth',2,...
                        'HorizontalAlignment','center','VerticalAlignment','middle','FontSize',12,'FitBoxToText','off');


%% Images 

 S.Clippy_axes=     axes('Parent',S.fh,'Position',[0.882416396979502 0.0134375 0.102481121898594 0.20375]);
                        Clippy_im=imread('Clippy.png','BackgroundColor',[0.933333337306976 0.933333337306976 0.933333337306976]);
                        imshow(Clippy_im) ;

 S.Bubble=          axes('Parent',S.fh,'Position',[0.49097802537914 0.0783811475409833 0.405725073200802 0.28620218579235]);
                        Bubble_im=imread("Speech_Bubble.png");
                        imshow(Bubble_im);
%% Axes

S.graph1=axes('Parent',S.fh,'Position',[0.0602617447277633 0.5265625 0.407915170051092 0.250759904371586]);%Plot raw (1-3)
S.graph2=axes('Parent',S.fh,'Position',[0.0602617447277633 0.228125 0.407915170051092 0.2375]);
S.graph4=axes('Parent',S.fh,'Position',[0.508351240560948 0.413194444444444 0.478605281178183 0.267987249544626]); %Result


%% Top Buttons
button_height=rawboxheight;
button_size=[0 0 0.16 0.08]
S.pb1 =             uicontrol('style','push',...    %Upload data
                    'unit','normalized',...
                    'position',button_size+[0.49 button_height 0 0],...
                    'string','Oscilloscope Settings',...
                    'fontunits','normalized','BackgroundColor',"#D5D5D5");

S.pb2 =             uicontrol('style','push',...    %Run Measurement 
                    'unit','normalized',...
                    'position',button_size+[0.66 button_height 0 0],...
                    'string','Run Measurement',...
                    'fontunits','normalized','BackgroundColor',"#D5D5D5");

S.pb3 =             uicontrol('style','push',...    %Reset
                    'unit','normalized',...
                    'position',button_size+[0.83 button_height 0 0],...
                    'string','RESET',...
                    'fontunits','normalized','BackgroundColor',"#D5D5D5");

button_height=rawboxheight-gap-0.08;

S.pb4 =             uicontrol('style','push',...    %Oscilloscope Settings
                    'unit','normalized',...
                    'position',button_size+[0.49 button_height 0 0],...
                    'string','Stage Settings',...
                    'fontunits','normalized','BackgroundColor',"#D5D5D5");

S.pb5 =             uicontrol('style','push',...    %Show age of data
                    'unit','normalized',...
                    'position',button_size+[0.66 button_height 0 0],...
                    'string','Show age of data',...
                    'fontunits','normalized','BackgroundColor',"#D5D5D5");

S.pb6 =             uicontrol('style','push',...    %Help
                    'unit','normalized',...
                    'position',button_size+[0.83 button_height 0 0],...
                    'string','Help',...
                    'fontunits','normalized','BackgroundColor',"#D5D5D5");

%% other buttons 
button_origin=gap+rawdatawidth+gap;

S.pb7 =             uicontrol('style','push',...    %Open Oscilloscope Settings
                    'unit','normalized',...
                    'position',[button_origin 0.02 0 0]+button_size,...
                    'string','Run Measurement',...
                    'fontunits','normalized','BackgroundColor',"#D5D5D5");
next=button_origin+0.17

S.pb8 =             uicontrol('style','push',...    %Open Stage Settings
                    'unit','normalized',...
                    'position',[next 0.02 0 0]+button_size,...
                    'string','Save',...
                    'fontunits','normalized','BackgroundColor',"#D5D5D5");

%% stage jog buttons 

jog_button_width=(status_box_width-3*gap)/2;

S.pb9 =             uicontrol('style','push',...    %jog forward
                    'unit','normalized',...
                    'position',[0.26 0.02 jog_button_width 0.04],...
                    'string','Jog Forward','BackgroundColor',"#D5D5D5");
 
S.pb10 =            uicontrol('style','push',...    %jog back
                    'unit','normalized',...
                    'position', [0.37 0.02 jog_button_width 0.04],...
                    'string','Jog Backwards','BackgroundColor',"#D5D5D5");
end