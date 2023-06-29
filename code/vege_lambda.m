function [lambda] = vege_lambda( Cs )
%vege_lambda représente la quantité de végétation par rapport au sol sans
%végétation. Cette valeur est adimensionelle.

lambda=1-(Cs/(600+Cs));

return