function [lambda] = vege_lambda( Cs )
%vege_lambda repr�sente la quantit� de v�g�tation par rapport au sol sans
%v�g�tation. Cette valeur est adimensionelle.

lambda=1-(Cs/(600+Cs));

return