function [t, y] = ode_45(f,tspan,y0)
tic
[t, y] = ode45(f,tspan,y0);
toc
return