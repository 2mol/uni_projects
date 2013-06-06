%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Poisson Glg im Einheitsquadrat  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all

w=0;
figure();
[N,T,P]=Gitter(0,w);
PlotGitter(N,T,P);

for i=1:4
    [N,T,P]=GitVerfeinerung(N,T,P);
    PlotGitter(N,T,P);
    figure();
end

pause
bc=inline('x+y','x','y');
u=FEHelmholtz2D(bc,N,T,w,P);

% PlotLoesung(real(u),N,T,P);
mesh([]);
for k=1:size(T,1)
    patch(N(T(k,1:3),1),N(T(k,1:3),2),u(T(k,1:3)),u(T(k,1:3)));
end