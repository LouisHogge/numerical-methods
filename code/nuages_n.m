function [n] = nuages_n( T , Wa )
%nuages_n renvoie la valeur de la quantité relative de nuages. Cette valeur
%est adimensionelle.

q=humidite_q(T,Wa);

if 0<=q && q<=(1/2)
    n=0;
    
elseif (1/2)<q && q<1
    n=2*q-1;
    
elseif q>=1
    n=1;

else
    n=0;

end

return