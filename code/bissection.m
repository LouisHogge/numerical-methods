%La bissection est une m�thode num�rique utilis�e pour calculer une des racines
%d'une fonction situ�e dans l'intervalle [x0,x1] � une tol�rance pr�s(tol).
function [x,statut] = bissection ( f, x0, x1, tol)
%On �value la valeur des deux points au d�but afin d'�viter le calcul
%de ces valeurs � plusieurs reprises.
y0 = f(x0);
y1= f(x1);
nbiterations=0;
nbMaxiterations=60;

%On v�rifie si les deux images sont finie, sans quoi l'utilisation de la
%m�thode de la bissection n'est pas possible.Dans ce cas, le statut est
%�gal � -1, on affiche un message d'erreur et la fonction est arret�e.
if ( ~isfinite(y0)|| ~isfinite(y1))
    text='Un de ces points n appartient pas au domaine de cette fonction';
    disp(text);
    x= 0;
    statut=-1;
    return
end

%On v�rifie si les images de ces deux points sont bien de signes oppos�s,
%ce qui demeure �tre une hypoth�se de la bissection, sans quoi la m�thode
%de la bisssection n'est pas r�alisable. Si les hypoth�ses ne sont pas
%v�rifi�es, la statut est �gal � 1, on affiche un message d'erreur et
%arr�te la fonction.
if y0*y1>0
    text='Entrez des valeurs ayant des images de signes differents';
    disp(text);
    x=0;
    statut=1;
    return
end 
%Il est n�cessaire d'avoir deux images de signes oppos�s pour d�marer la
%m�thode de la fonction mais il faut �galement savoir laquelle est la
%positive et laquelle est n�gative pour pouvoir appliquer la bissection. On
%v�rifie �galement qu'une des deux images n'est pas d�j� racine de la
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
%La m�thode de la bissection prend les deux valeurs pr�c�dentes et en fait
%la moyenne afin de sa rapprocher de plus en plus de la racine.On effectue
%une premi�re fois cette op�ration avant de rentrer dans la boucle, on
%initialise un compteur nbiterations dont on expliquera l''int�r�t plus
%tard.
x=(a+b)/2;
u= f(x);

% Dans cette boucle, on applique la m�thode de la bissection jusqu'�
% obtenir une image iinf�rieure � la tol�rance, ce point pourra d�s lors
% �tre consid�r� comme une racine.A chaque it�ration de la boucle, noous
% incr�mentons un compteur nbiterations qui ne peut d�passer une valeur
% maximal.Lorsqu'on arrive � cette valuer, suffisamment grand, c'est que la
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

%Si on a atteint le nombre maximal d'it�ration autoris�, c'est que la
%fonction ne converge pas, d�s lors, le statut est �gal  � -1, et on
%affiche un message d'erreur.
if nbiterations>=nbMaxiterations
   text='la fonction ne converge pas';
   disp(text);
   x=0;
   statut=-1;
   return
end
% Si on a trouv� un valeur dont l'image est, � la tol�rance pr�s, �gale �
% 0, on renvoie un statut �gal � 0, la racine �gale � x, et la fonction se
% termine.
statut=0;
return