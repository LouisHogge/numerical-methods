function [e] = emission_e( t , prct_dim )
%emission_e renvoie la valeur des emissions de CO2 anthropiques et est
%exprimé en Gt/an.

temps=1860:1:3000;
emission=[0:0.1:10 10.4:0.4:34 34.02:0.02:53.6]; 

emission(160:240)=emission(160:240)*(1-prct_dim);

e=interp1(temps,emission,t,'spline',0);

return