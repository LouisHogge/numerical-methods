%Methode d'euler explicite considerant un developpement de Taylor tronque a
%l'ordre 1. Elle prend en entree une fonction "f", un intervalle de temps
%"tspan", des variables initiales "y0", "S" et "alpha_a" sont des variables
%facultatives amenees à etre modifiees dans les recherches de parametres.
%Elle prend egalement en entrée l'argument "tol" qui est la tolérance
%acceptée pour déterminer si la fonction a atteint un equilibre.
%Elle renvoie les valeurs calculees en fonction du temps.
function [t, y] = eul_expl (f,tspan,y0,tol) 

%h = le pas
h = 0.1;

%par défaut, on fixe tol à 0.1
if nargin==3
    tol=0.1;
end
%on calcule la taille du vecteur des conditions initiales
taille=length(y0);

%vecteur temps avec "t0" temps initiale et "tf" temps finale.
t0=tspan(1);
tf=tspan(2);

%ptmax correspond au nombre d'unites de temps. Ceil correspond a
%un arrondit vers le haut.
ptmax=ceil((tf-t0)/h);

%on initialise un tableau "y" de L et ptmax C rempli de 0 qui accueillera les
%points calcules par euler explicite.
y=zeros(ptmax,taille);

%On initialise un tableau "t" de 1L et ptmax C rempli de 0 qui accueillera
%les différents t.
t = zeros (ptmax,1);

ligne=2;

%on met les variables initiales dans le vecteur "yn".
yn=y0;

%On place les variables initiales aux premieres places des lignes du
%tableau "y".
for i=1:taille
    y(1,i)=yn(i);
end

tn=t0;

%Boucle calculant les valeurs successives de chaque variable initiale a
%l'aide de l'algorithme d'euler explicite.
while tn <= tf 

dVar=f(tn,yn);
    

    for colonne=1:taille
%Algorithme d'euler explicite.
        y(ligne,colonne) = yn(colonne) + h * dVar(colonne);
        yn(colonne) = y(ligne,colonne);
    end
%On passe a l'unite de temps suivante.
    tn = tn + h;
%On place la valeur courante du temps dans le vecteur "t".
    t(ligne) = tn;
%On passe a la colonne suivante
    ligne=ligne+1;
end

%On vérifie qu'on a atteint un équilibre avec les 5 dernieres valeurs de y.
%Si ce n'est pas le cas on renvoie y=0.
for n=ptmax-4:ptmax
    if abs(y(n-1,1)-y(n,1))>tol
        y=0;
       return
    end
end

return

