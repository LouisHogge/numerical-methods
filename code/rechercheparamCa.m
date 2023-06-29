%Cette fonction calcul l'intervalle du param�tre Ca qui donne une
%temp�rature comprise entre T1 et T2.
function [Param,statut] = rechercheparamCa( T1 , T2 , Var0,CaMin,CaMax)

tol=0.01;

%On effectue la m�thode de la s�cante sur la fonction cr��e par
%T_equilibreCa dans le cas de T1. La racine obtenue est la valeur de Ca pour que la
%temp�rature soit �gale � T1.
[Param1, conv1]=secante(@(Ca)(T_equilibreCa(T1,Var0,Ca)),CaMin,CaMax,tol);

%On v�rifie ici si la m�thode de la s�cante a converg�, si ce n'est
%pas le cas, le statut vaut 1.
if conv1==-1 || conv1==1
    statut=1;
    Param=0;
    return
end

%Nous effectuons le m�thode de la s�cante sur la fonction cr��e par
%T_equilibreCa dans le cas de T2. La racine obtenue est la valeur de Ca
%pour laquelle la temp�rature est �gale � T2.
[Param2, conv2]=secante(@(Ca)(T_equilibreCa(T2,Var0,Ca)),CaMin,CaMax,tol);

%On  v�rifie ici si la m�thode de la s�cante a converg�, si ce n'est
%pas le cas, le statut vaut 1.
if conv2==-1 || conv2==1
    statut=1;
    Param=0;
    return
end

%On d�termine l'intervalle.
Param(1)=Param1;
Param(2)=Param2;
statut=0;

return