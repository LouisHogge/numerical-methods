%Renvoie la diff�rence entre la temp�rarure d'�quilibre d'euler et une
%temp�rarure T1 donn�e en argument. Prend Ca (quantit� de carbone dans l'air) en argument et
%l'applique dans euler.
function [T]=T_equilibreCa(T1,Var0,Ca)

[~, y]=eul_expl(@odefun,[0 250],[Var0(1) Ca Var0(3) Var0(4) Var0(5)]);

Tn=y(end,1); 

T=Tn-T1;
return