function [fsn] = neige_fsn ( T )
%neige_fsn renvoie la valeur de la quantit� relative de terre recouverte de
%neige. Cette valeur est adimensionelle et d�pend de la temp�rature.

if T>15
    fsn=0;
    
elseif -15<=T && T<=15
    fsn=1-(T+15)/30;
    
elseif T<-15
    fsn=1;
else
    fsn=1;
end

return

