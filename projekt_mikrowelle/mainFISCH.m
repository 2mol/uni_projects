%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fisch in der Mikrowelle %
%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all
%clear all

f=2.45e9;
w=2*pi*f;
bc=inline('100*(x==0.5 & 0.1<=y & 0.2>=y)','x','y');


[N,T,P]=Gitter(3,w);
[N,T,P]=GitVerfeinerung(N,T,P);
PlotGitter(N,T,P);
pause

for i=1:3
    [N,T,P]=GitVerfeinerung(N,T,P);
    u=FEHelmholtz2D(bc,N,T,w,P);
    figure()
    PlotLoesung(real(u),N,T,P);
    figure()
    PlotFisch(real(u),N,T,P);
    pause
end