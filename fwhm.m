function [width, center, roots, Yfit]=fwhm(X,Y)
%fwhm function for gaussian / sech2 pulses. A fit if given to the data with
%the half max found and a stragiht line intersects the fit at the x,y
%locations of the fwhm at either side
format long
fitobject=fit(X,Y,'gauss2');
Yfit=feval(fitobject,X);

max_es=find(Yfit==(max(Yfit)));                   %find locations with max values 

if mod(length(max_es),2)==1;                %for odd numners the result will be 1 
    center=max_es((length(max_es)/2)+0.5);  % therefore for odd numbers, the center location is 
    else
    center=max_es(length(max_es)/2) ;       %gives the location of the maximum 
end

cenY=((Yfit(center)-min(Yfit))/2)+min(Yfit)  ;      %find half max value 


strt_line=cenY*ones(1,length(X))  ;          %creating straight line to compair wit curve

L1=[rot90(vertcat(X)) ; strt_line];
L2=[rot90(vertcat(X)) ; rot90(vertcat(Yfit))] ;  %linear arrays to be compared

r=coeffvalues(fitobject)            ;            %results of comparision 
format long;
roots=(InterX(L1,L2));
width=roots(1,2)-roots(1,1);
end