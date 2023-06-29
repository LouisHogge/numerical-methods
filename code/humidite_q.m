function [q] = humidite_q( T , Wa )
%humidite_q représente la valeur de l'humidité moyenne relative, cette
%valeur est adimensionelle.

q=(Wa)/(saturation_Wa(T));

return