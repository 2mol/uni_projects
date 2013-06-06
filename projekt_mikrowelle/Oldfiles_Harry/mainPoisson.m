%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Poisson Glg im Einheitsquadrat  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

w=0;

[N,T,P]=Gitter(0,w);
figure();
PlotGitter(N,T,P);
[N,T,P]=GitVerfeinerung(N,T,P);
figure();
PlotGitter(N,T,P);
figure();
[N,T,P]=GitVerfeinerung(N,T,P);
PlotGitter(N,T,P);
figure();
[N,T,P]=GitVerfeinerung(N,T,P);
PlotGitter(N,T,P);
figure();
[N,T,P]=GitVerfeinerung(N,T,P);
PlotGitter(N,T,P);
pause
bc=inline('x+y','x','y');
u=FEHelmholtz2D(bc,N,T,w,P);
PlotLoesung(real(u),N,T,P);