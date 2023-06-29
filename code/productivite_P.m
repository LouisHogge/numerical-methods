function [P] = productivite_P( T , Ca , Cs , Ws )
%productivite_P renvoie la croissance de la v�g�tation, aussi appel�e
%productivit� et exprim�e en Gt/an

%P_max est la valeur de la productivit� maximale par an.
P_max=200;

P=P_max*g_T(T)*g_C(Ca,Cs)*g_W(Ws);

return

