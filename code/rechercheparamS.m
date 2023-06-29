%Cette fonction calcul l'intervalle du paramètre S qui donne une
%température comprise entre T1 et T2.
function [Param,statut] = rechercheparamS( T1 , T2 , Var0 , Smin , Smax)

tol=0.001;

%On effectue la méthode de la sécante sur la fonction créée par
%T_equilibreS dans le cas de T1. La racine obtenue est la valeur de S pour que la
%température soit égale à T1.
[Param1, conv1]=secante(@(S)(T_equilibreS(T1,Var0,S)),Smin,Smax,tol);

%On vérifie ici si la méthode de la sécante a convergé, si ce n'est
%pas le cas, le statut vaut 1.
if conv1==-1 || conv1==1
    statut=1;
    Param=0;
    return
end

%Nous effectuons le méthode de la sécante sur la fonction créée par
%T_equilibreS dans le cas de T2. La racine obtenue est la valeur de S
%pour laquelle la température est égale à T2.
[Param2, conv2]=secante(@(S)(T_equilibreS(T2,Var0,S)),Smin,Smax,tol);

%On  vérifie ici si la méthode de la sécante a convergé, si ce n'est
%pas le cas, le statut vaut 1.
if conv2==-1 || conv2==1
    statut=1;
    Param=0;
    return
end

%On détermine l'intervalle.
Param(1)=Param1;
Param(2)=Param2;
statut=0;

return

