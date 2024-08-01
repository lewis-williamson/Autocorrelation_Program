function   Ss = Structure

   h = get(0, 'Children');     
    r=isempty(findobj(h,'name','Stage Settings'));
    if r==0
        close('Stage Settings')
    end


O.fh = figure('units','normalized',...              %create box dimensions 
                    'position',[0.5 0.4 0.2 0.4],...
                    'menubar','none',...
                    'name','Stage Settings',...
                    'numbertitle','off',...
                    'resize','on',...
                    'deletefcn','');

Large_buttonDims = [0 0 1   0.15];
Small_buttonDims = [0 0 1   0.10];
Connect_button   = [0 0 0.5 0.15];
Space=[0.0 0.075 0.0 0.0]

Ss.pb1=uicontrol('Parent',O.fh,'Style', 'popupmenu', 'String', {'Select K-Cube';'97101961'}, ...
          'Units', 'normalized', 'Position', Small_buttonDims + 4*Space);


Ss.pb2=uicontrol('Parent',O.fh,'Style', 'popupmenu', 'String', {'Jog Step 1','Jog Step 2','Jog Step 3'}, ...
          'Units', 'normalized', 'Position', Small_buttonDims + 3*Space);

Ss.pb3=uicontrol('Parent',O.fh,'style', 'popupmenu', 'string', {'Some Other setting for the stage, maybe acceletation?'}, ...
          'Units', 'normalized', 'Position', Small_buttonDims + 2*Space);

Ss.pb4=uicontrol('Parent',O.fh,'Style','pushbutton','String', 'Upload to Stage', ...
          'Units', 'normalized', 'Position', Connect_button + [0.0 0. 0.0 0.0]);

Ss.pb5=uicontrol('Parent',O.fh,'Style','pushbutton','String', 'Show Current Settings', ...
          'Units', 'normalized', 'Position', Connect_button + [0.5 0 0.0 0.0]);

%textboxes
Ss.rec1=annotation('Parent',O.fh,'rectangle',   [0.0430578137016562 0.420867681488325 0.9 0.378750639122362],'LineWidth',3);
Ss.text=annotation('Parent',O.fh,'textbox',  [0.0430578137016562 0.420867681488325 0.9 0.378750639122362]);
Ss.rec2=annotation('Parent',O.fh,'rectangle', [0.0478425026968712 0.83587786259542 0.899999999999999 0.13358778625954],'LineWidth',3);
Ss.connection_status=annotation('Parent',O.fh,'textbox',[0.0478425026968712 0.83587786259542 0.899999999999999 0.13358778625954]);
end