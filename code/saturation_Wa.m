function [Wa_etoile] = saturation_Wa( T )
%Wa_etoile calcule la quantité de saturation en eau en g/cm^2 à partir de
%la température.

Wa_etoile=exp((17.638*T)/(T+243.4));

return