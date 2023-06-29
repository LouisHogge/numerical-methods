%La bissection est une méthode numérique utilisée pour calculer une des racines
%d'une fonction située dans l'intervalle [x0,x1] à une tolérance près(tol).
function [x,statut] = bissection ( f, x0, x1, tol)
%On évalue la valeur des deux points au début afin d'éviter le calcul
%de ces valeurs à plusieurs reprises.
y0 = f(x0);
y1= f(x1);
nbiterations=0;
nbMaxiterations=60;

%On vérifie si les deux images sont finie, sans quoi l'utilisation de la
%méthode de la bissection n'est pas possible.Dans ce cas, le statut est
%égal à -1, on affiche un message d'erreur et la fonction est arretée.
if ( ~isfinite(y0)|| ~isfinite(y1))
    text='Un de ces points n appartient pas au domaine de cette fonction';
    disp(text);
    x= 0;
    statut=-1;
    return
end

%On vérifie si les images de ces deux points sont bien de signes opposés,
%ce qui demeure être une hypothèse de la bissection, sans quoi la méthode
%de la bisssection n'est pas réalisable. Si les hypothèses ne sont pas
%vérifiées, la statut est égal à 1, on affiche un message d'erreur et
%arrête la fonction.
if y0*y1>0
    text='Entrez des valeurs ayant des images de signes differents';
    disp(text);
    x=0;
    statut=1;
    return
end 
%Il est nécessaire d'avoir deux images de signes opposés pour démarer la
%méthode de la fonction mais il faut également savoir laquelle est la
%positive et laquelle est négative pour pouvoir appliquer la bissection. On
%vérifie également qu'une des deux images n'est pas déjà racine de la
%fonction sans quoi la bissection est inutile.
if y0 >0
    a=x0;
    b=x1;
elseif y0<0
    b=x0;
    a=x1;

elseif y0==0
    x=x0;
    statut=0;
    return
elseif y1 ==0
    x=x1;
    statut=0;
    return
end
%La méthode de la bissection prend les deux valeurs précédentes et en fait
%la moyenne afin de sa rapprocher de plus en plus de la racine.On effectue
%une première fois cette opération avant de rentrer dans la boucle, on
%initialise un compteur nbiterations dont on expliquera l''intérêt plus
%tard.
x=(a+b)/2;
u= f(x);

% Dans cette boucle, on applique la méthode de la bissection jusqu'à
% obtenir une image iinférieure à la tolérance, ce point pourra dès lors
% être considéré comme une racine.A chaque itération de la boucle, noous
% incrémentons un compteur nbiterations qui ne peut dépasser une valeur
% maximal.Lorsqu'on arrive à cette valuer, suffisamment grand, c'est que la
% fonction ne converge pas vers une racine, et que le programmme tourne en
% rond.
while (abs(u)>=tol && nbiterations < nbMaxiterations)

nbiterations=nbiterations+1;
x=(a+b)/2;
u= f(x);
    if u>0
        a=x;
    elseif u<0
        b=x;
    elseif u==0
        statut=0;
        return
    end
end

%Si on a atteint le nombre maximal d'itération autorisé, c'est que la
%fonction ne converge pas, dès lors, le statut est égal  à -1, et on
%affiche un message d'erreur.
if nbiterations>=nbMaxiterations
   text='la fonction ne converge pas';
   disp(text);
   x=0;
   statut=-1;
   return
end
% Si on a trouvé un valeur dont l'image est, à la tolérance près, égale à
% 0, on renvoie un statut égal à 0, la racine égale à x, et la fonction se
% termine.
statut=0;
return