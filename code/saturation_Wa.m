function [Wa_etoile] = saturation_Wa( T )
%Wa_etoile calcule la quantit� de saturation en eau en g/cm^2 � partir de
%la temp�rature.

Wa_etoile=exp((17.638*T)/(T+243.4));

return