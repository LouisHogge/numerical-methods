%Renvoie la diff�rence entre la temp�rarure d'�quilibre d'euler et une
%temp�rarure T1 donn�e en argument. Prend S (l'ensoleillement) en argument et
%l'applique dans euler.
function [T]=T_equilibreS(T1,Var0,S)

[~, y]=eul_expl(@(t,Var)odefun(t,Var,S,0.1,0),[0 200],Var0);

Tn=y(end,1);

T=Tn-T1 ;
return