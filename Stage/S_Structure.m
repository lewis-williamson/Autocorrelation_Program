function   S = Structure

   h = get(0, 'Children');     
    r=isempty(findobj(h,'name','Stage Settings'));
    if r==0
        close('Stage Settings')
    end


O.fh = figure('units','normalized',...              %create box dimensions 
                    'position',[0.5 0.11 0.2 0.3],...
                    'menubar','none',...
                    'name','Stage Settings',...
                    'numbertitle','off',...
                    'resize','on',...
                    'deletefcn','');

Large_buttonDims = [0 0 1   0.15];
Small_buttonDims = [0 0 1   0.10];
Connect_button   = [0 0 0.5 0.15];
Space=[0.0 0.075 0.0 0.0]
S.pb1=uicontrol('Parent',O.fh,'style', 'popupmenu', 'string', {'Some Other setting for the stage, maybe acceletation?'}, ...
          'Units', 'normalized', 'Position', Small_buttonDims + 2*Space);

S.pb2=uicontrol('Parent',O.fh,'Style', 'popupmenu', 'String', {'Jog Step 1','Jog Step 2','Jog Step 3'}, ...
          'Units', 'normalized', 'Position', Small_buttonDims + 3*Space);

S.pb3=uicontrol('Parent',O.fh,'Style', 'popupmenu', 'String', {'Select K-Cube';'97101961'}, ...
          'Units', 'normalized', 'Position', Small_buttonDims + 4*Space);

S.pb4=uicontrol('Parent',O.fh,'Style','pushbutton','String', 'Upload to Stage', ...
          'Units', 'normalized', 'Position', Connect_button + [0.0 0. 0.0 0.0]);

S.pb5=uicontrol('Parent',O.fh,'Style','pushbutton','String', 'Show Current Settings', ...
          'Units', 'normalized', 'Position', Connect_button + [0.5 0 0.0 0.0]);

%textboxes
S.rec1=annotation('Parent',O.fh,'rectangle', [0.0478425026968715 0.487661574618096 0.9 0.433607520564042],'LineWidth',3);
S.text=annotation('Parent',O.fh,'textbox',[0.0478425026968715 0.487661574618096 0.9 0.433607520564042]);
end