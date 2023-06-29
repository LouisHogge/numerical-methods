%Renvoie la difference entre la temperature d'equilibre avec emissions
%intitiales de carbone, diminuee de 2, et la temperature  d'equilibre avec emissions 
%reduites de carbone. Temperatures calculees via la methode d'euler
%explicite. Prend prct_dim (le pourcentage) en argument et l'applique dans euler.

function [T]=T_equilibrePrct(Tred,Var0,prct_dim)

[~, y]=eul_expl(@(t,Var)odefun(t,Var,340,0.1,0),[1860 2100],Var0,1);
T0=y(end,1);

[~, z]=eul_expl(@(t,Var)odefun(t,Var,340,0.1,prct_dim),[1860 2100],Var0,1);
Tf=z(end,1);

%On diminue de Tred la temperature d'équilibre avec emissions intitiales de carbone
%car l'objectif est d'obtenir une diminution de Tred degres de la temperature.

T=Tf-(T0-Tred);
return