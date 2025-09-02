function Ns=fans(Ig,T)%abbr:new solution,find a new solution,initial guass,temperature
flb=-3;             %funcion's lower bound
fub=3;              %funcion's upper bound
y=randn();
TgNew=Ig+T*y;
if TgNew>=flb&&TgNew<=fub
    Ns=TgNew;
elseif TgNew<flb
    r=rand();
    Ns=r*flb+(1-r)*Ig;
else
    r=rand();
    Ns=r*fub+(1-r)*Ig;
end
end