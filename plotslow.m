function []=plotslow(x,y,location)
            len=length(x)
           hold on
            for i=1:100:len
                    axes(location)
                if i<=len
                    axes(location)
                    xlim([0 0.00001])
                    ylim([0 1])
                    plot(x(1:i),y(1:i))
                else 
                    axes(location)
                    plot(x,y)
                end 
            end     

        end 