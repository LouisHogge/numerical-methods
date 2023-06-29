function [gT] = g_T( T )
%g_T est une fonction adimensionelle que l'on trouve en interpolant à
%partir des valurs données dans l'énoncé.

x=[5 18 25.5 33 40];

y=[0 0.8 1 0.75 0];

gT=interp1(x,y,T,'spline',0);

return