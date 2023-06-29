function [alpha] = albedo_alpha( T , Cs , Wa , alpha_a )
%albedo_alpha calcule la valeur de l'albedo, c'est une valeur sans
%dimension.

%alpha_surf est calculé pour être utilisé dans le calcul de l'albedo.
alpha_surf=(vege_lambda(Cs)*0.4+(1-vege_lambda(Cs))*0.1)*(1-neige_fsn(T))+0.7*neige_fsn(T);

alpha=alpha_a+0.4*nuages_n(T,Wa)+(alpha_surf)*(0.81-0.56*nuages_n(T,Wa));

return
