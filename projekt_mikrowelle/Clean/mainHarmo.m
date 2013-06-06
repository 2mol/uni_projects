%%%%%%%%%%%%%%%%%%%
% Leere Mikrowelle
% Quelle=exp(iwt)--> harmonische Loesung in der Zeit
%%%%%%%%%%%%%%%%%%%
f=2.45e9;
w=2*pi*f;

[N,T,P]=Gitter(2,w);
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
figure();
[N,T,P]=GitVerfeinerung(N,T,P);
PlotGitter(N,T,P);
figure();
bc=inline('100*(x==0.5 & 0.1<=y & 0.2>=y)','x','y');
u=FEHelmholtz2D(bc,N,T,w,P);
PlotLoesung(real(u),N,T,P);

