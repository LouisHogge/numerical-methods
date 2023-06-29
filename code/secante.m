% La methode de la secante est un algorithme de recherche d'une racine d'une 
% fonction situee dans l'intervalle [x0,x1] à une tolerance pres(tol).
function [x, statut] = secante (f, x0, x1, tol)
% On place les points x0 et x1 respectivement dans les variables a et b.
% Afin de minimiser les appels à f dans la boucle "while", on place ceux-ci
% dans les variables Ya et Yb correspondant respectivement aux points a et b.
% On initialise le compteur d'itérations de la boucle "while" à 0 et le
% nombre maximum d'itérations permis à 60.
a = x0;
Ya = f(a);
b = x1;
Yb = f(b);
nbIterations = 0;
nbMaxIterations = 60;

% On vérifie que les points a et b entres par l'utilisateur ont des images
% différentes.
% Dans le cas contraire, 2 problemes se posent : 
% 1) Les 2 points entres par l'utilisateur sont en réalité le même point :
% ---> l'algorithme de la secante nécéssite 2 points distincts.
% 2)Les 2 points entres par l'utilisateur ont la même image :
% ---> une erreur se produit dans la formule (ligne 33) => le denominateur
%      Yb - Ya = 0 ce qui entraine c infini.
if (Ya == Yb)
    text = 'La methode de la secante requiert 2 points ayant des images distinctes.';
    disp (text);
    x=0;
    statut = 1;
    return
end

% La boucle "while" applique l'algorithme de la sécante tant que la racine
% n'a pas été trouvée, à la tolérance près et que le nombre d'iterations 
% maximum n'est pas atteint.
while abs(Yb) > tol && nbIterations < nbMaxIterations
    c= b - ((Yb*(b-a))/(Yb-Ya));
    a=b;
    b=c;
    Ya=Yb;
    Yb=f(c);
    nbIterations = nbIterations+1;
% Si c est infini la fonction ne converge pas.    
    if ~isfinite(c)
        text = 'Cette fonction ne converge vers aucune racine.1';
        disp (text);
        x=0;
        statut = -1;
        return
    end
end

% Si le compteur d'itérations dépasse le nombre maximum d'itérations permis,
% la fonction ne converge vers aucune racine.
if (nbIterations >= nbMaxIterations)
    text = 'Cette fonction ne converge vers aucune racine.3';
    disp (text);
    x=0;
    statut = -1;
    return
end

% On renvoie la racine trouvée.
statut=0;
x=b; 
return