%Cette fonction calcul le pourcentage (prct_dim) qui permet d'obtenir une 
%diminution de 2 degres de la temperature.

function [Param,statut] = rechercheparamPrct(Tred,Var0)

tol=0.01;
prctMin=0;
prctMax=1;

%On effectue la methode de la sécante sur la fonction creee par
%T_equilibrePrct. La racine obtenue est la valeur de prct_dim pour que la
%temperature finale soit egale à la temperature initiale diminuee de 2 degres.

[Param0, conv]=secante(@(prct_dim)(T_equilibrePrct(Tred,Var0,prct_dim)),prctMin,prctMax,tol);

%On verifie ici si la methode de la secante a converge, si ce n'est
%pas le cas, le statut vaut 1.

if conv==-1 || conv==1
    statut=1;
    Param=0;
    return
end

%on multiplie par 100 pour obtenir notre pourcentage.
Param=Param0*100;
statut=0;

if Param>100

    Param=100;
    text='Il n est pas possible de réduire suffisament les émitions pour atteindre la température demandée';
    disp(text);
end

return