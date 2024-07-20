function []=Speak(txt,location) 

 set(location,'String','','FontName','Comic Sans MS','FitBoxToText','off');
        
                    len=length(txt);
                    for i=1:len;
                        
                            Display(txt(1:i),location);
                            pause(.01);
                    end 
                            Display(txt,location);
                        
end