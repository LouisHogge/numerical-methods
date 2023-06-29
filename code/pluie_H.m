function [H] = pluie_H( T , Wa )
%pluie_H représente la pluie tombée en un an en g/cm^2 an

nu=0.192;

H=nu*nuages_n(T,Wa)*Wa;

return