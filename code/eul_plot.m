%Dessine le graphe des valeurs renvoyées par euler explicite en fonction du
%temps.
function eul_plot(f,tspan,y0,tol)

[t, y]=eul_expl(f,tspan,y0,tol);

plot(t,y);
 return
