function [E] = evapo_E( T , Ca , Cs , Wa , Ws )
%evapo_E renvoie une valeur correspondant a l'evaporation et a
%l'evapotranspiration, la valeur retourn�e est exprim�e en g/cm^2 an

%k_sol est une constante pour le sol en g an/cm^2
k_sol=7;

%k_veg est une constante pour la v�g�tation g/cm^2 Gt
k_veg=0.7;

%evapo_sol correspond � l'�vaporation d'un sol sans v�g�taux.
evapo_sol=(saturation_Wa(T)-Wa)*(Ws/k_sol);
%evapo_veg correspond � l'�vapotranspiration des v�g�taux.
evapo_veg=k_veg*productivite_P( T , Ca , Cs , Ws );

E=vege_lambda(Cs)*evapo_sol+(1-vege_lambda(Cs))*evapo_veg;

return