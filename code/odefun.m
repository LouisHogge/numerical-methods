%odefun est une fonction prenant en arguments un t, des conditions initiales, les
%arguments S et Alpha sont facultatifs. La fonction renvoie la valeur des
%d�riv�es de ces conditions initiales.
function [dVar] = odefun(t,Var,S,alpha_a,prct_dim)

T=Var(1);
Ca=Var(2);
Cs=Var(3);
Wa=Var(4);
Ws=Var(5);

%Si les param�tres d'entr�e Ca, Cs, Wa ou Ws sont n�gatifs on les
%initialise � 0. En effet leur signification physique ne leur permet pas
%d'etre negatif.
if Ca<0
    Ca=0;
end

if Cs<0
    Cs=0;
end

if Wa<0
    Wa=0;
end

if Ws<0
    Ws=0;
end


%Si on ne pr�cise pas le S et le alpha_a en argument d'entr�e, on les
%initialise � leur valeur par d�faut.
if nargin==2
alpha_a=0.1;
S=340;
prct_dim=0;
end

if S<0
    S=0;
end

if alpha_a<0
    alpha_a=0;
end
   
%m est une constante exprim�e en an^-1.
m=0.08;

%k est une constante repr�sentant la capacit� thermique de la plan�te en 
%W an/m^2 K.
k=16.9;

%kw est une constante repr�sentant la chaleur latente d'�vaporation en J/g.
kw=2257;


P=productivite_P(T,Ca,Cs,Ws);
H=pluie_H(T,Wa);
E=evapo_E(T,Ca,Cs,Wa,Ws);

dCs=P-m*Cs;

dCa=-P+m*Cs+emission_e(t,prct_dim);

dWa=-H+E;

dWs=H-E;


kw_dWs_conv=kw*dWs/3153.6;
%On convertit la temp�rature en Kelvin.
T_conv=T+273.15;

dT=(1/k)*(S*(1-albedo_alpha(T,Cs,Wa,alpha_a))-sigma_eff(Ca,Wa)*T_conv^4-kw_dWs_conv);

dVar=[dT; dCa; dCs; dWa; dWs];

return






