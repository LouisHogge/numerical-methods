function [q] = humidite_q( T , Wa )
%humidite_q repr�sente la valeur de l'humidit� moyenne relative, cette
%valeur est adimensionelle.

q=(Wa)/(saturation_Wa(T));

return