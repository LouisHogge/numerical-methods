function [coeff] = sigma_eff( Ca , Wa )
%sigma_eff renvoie le coefficient de proportinalité de la loi de 
%Stefan-Boltzmann exprimé en W/m^2 K^4

%sigma est la constante de la loi de Stefan-Boltzmann.
sigma=5.67*10^-8;

phiC=1-(0.4*Ca)/(750+Ca);
phiW=(1.02258+(Wa^0.409))/(1+2.258*(Wa^0.409));

coeff=sigma*phiC*phiW;

return
