function O = Structure
   
%close preexisting settings figure
    h = get(0, 'Children');     
    r=isempty(findobj(h,'name','Oscilloscope Settings'));
    if r==0
        close('Oscilloscope Settings')
    end

%% structure
O.fh = figure('units','normalized','position',[0.7 0.7 0.2 0.5]...
                    ,'name','Oscilloscope Settings',...
                    'numbertitle','off');      
%Buttons
Large_buttonDims = [0 0 1   0.15];
Small_buttonDims = [0 0 1   0.10];
Connect_button   = [0 0 0.5 0.15];

O.pb1=uicontrol('Parent',O.fh,'style', 'popupmenu', 'string', {'Select Oscilloscope';'USB0::0x0699::0x03AA::C013099::0::INSTR'}, ...
          'Units', 'normalized', 'Position', Small_buttonDims + [0.0 0.2 0.0 0.0]);

O.pb2=uicontrol('Parent',O.fh,'Style', 'popupmenu', 'String', {'Timebase 1 (100ms)','Timebase 2 (50ms)','Timebase 3 (25ms)','Timebase 4 (10ms)'}, ...
          'Units', 'normalized', 'Position', Small_buttonDims + [0.0 0.15 0.0 0.0]);

O.pb3=uicontrol('Parent',O.fh,'Style', 'popupmenu', 'String', {'0ms Delay','-30ms Delay','-60ms Delay'}, ...
          'Units', 'normalized', 'Position', Small_buttonDims + [0.0 0.1 0.0 0.0]);

O.pb4=uicontrol('Parent',O.fh,'Style','pushbutton','String', 'Upload To Oscillpscope', ...
          'Units', 'normalized', 'Position', Connect_button + [0.0 0. 0.0 0.0]);

O.pb5=uicontrol('Parent',O.fh,'Style','pushbutton','String', 'Show Current Settings', ...
          'Units', 'normalized', 'Position', Connect_button + [0.5 0 0.0 0.0]);

%textboxes
textboxPosition = [0.05 0.32 0.9 0.57];
textboxConnection_status=[0.05 0.9 0.9 0.07];

O.text=annotation('Parent',O.fh,'textbox',textboxPosition,'LineWidth',3);
O.Conntext=annotation('Parent',O.fh,'textbox',textboxConnection_status,'LineStyle','none');
end 