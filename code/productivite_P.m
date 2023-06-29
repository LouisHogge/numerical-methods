function [P] = productivite_P( T , Ca , Cs , Ws )
%productivite_P renvoie la croissance de la végétation, aussi appelée
%productivité et exprimée en Gt/an

%P_max est la valeur de la productivité maximale par an.
P_max=200;

P=P_max*g_T(T)*g_C(Ca,Cs)*g_W(Ws);

return

