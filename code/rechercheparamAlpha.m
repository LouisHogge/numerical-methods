%Cette fonction calcul l'intervalle du param�tre Alpha qui donne une
%temp�rature comprise entre T1 et T2.

function [Param,statut] = rechercheparamAlpha( T1 , T2 , Var0 , AlphaMin , AlphaMax)

tol=1e-9;

%On effectue la m�thode de la s�cante sur la fonction cr��e par
%T_equilibreAlpha dans le cas de T1. La racine obtenue est la valeur de Alpha pour que la
%temp�rature soit �gale � T1.
[Param1, conv1]=secante(@(Alpha)(T_equilibreAlpha(T1,Var0,Alpha)),AlphaMin,AlphaMax,tol);

%On v�rifie ici si la m�thode de la s�cante a converg�, si ce n'est
%pas le cas, le statut vaut 1.
if conv1==-1 || conv1==1
    statut=1;
    Param=0;
    return
end

%Nous effectuons le m�thode de la s�cante sur la fonction cr��e par
%T_equilibreAlpha dans le cas de T2. La racine obtenue est la valeur de Alpha
%pour laquelle la temp�rature est �gale � T2.
[Param2, conv2]=secante(@(Alpha)(T_equilibreAlpha(T2,Var0,Alpha)),AlphaMin,AlphaMax,tol);

%On  v�rifie ici si la m�thode de la s�cante a converg�, si ce n'est
%pas le cas, le statut vaut 1.
if conv2==-1 || conv2==1
    statut=1;
    Param=0;
    return
end

%On d�termine l'intervalle.
Param(2)=Param1;
Param(1)=Param2;
statut=0;

return

