function []=Speak(txt,location)
if location=='O.Ostatus'
    size=10
else 
    size=14
end
        set(location,'String','','LineStyle','none', ...
                            'FontSize',size,'FontName','Comic Sans MS','FitBoxToText','off');
        
                    len=length(txt);
                    for i=1:len;
                        
                            Display(txt(1:i),location);
                            pause(.01);
                    end 
                            Display(txt,location);
                        
end