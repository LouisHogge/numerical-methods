function [gW] = g_W( Ws )
%g_W est une fonction adimensionelle que l'on trouve en interpolant �
%partir des valurs donn�es dans l'�nonc�.

x=[1 9.5 18];

y=[0 1 0];

gW=interp1(x,y,Ws,'spline',0);

return
