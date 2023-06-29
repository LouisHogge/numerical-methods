%Renvoie la diff�rence entre la temp�rarure d'�quilibre d'euler et une
%temp�rarure T1 donn�e en argument. Prend Alpha (l'albedo) en argument et
%l'applique dans euler.
function [T]=T_equilibreAlpha(T1,Var0,Alpha)

[~, y]=eul_expl(@(t,Var)odefun(t,Var,340,Alpha,0),[0 250],Var0,0.1);

Tn=y(end,1);

T=Tn-T1;
return