%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Poisson Glg im Einheitsquadrat
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
%pause
bc=inline('x+y','x','y');
u=FEHelmholtz2D(bc,N,T,w,P);
%PlotLoesung(real(u),N,T,P);

% leere 3d plot 
mesh([]);
                    
for i=1:size(T,1),
  patch(N(T(i,1:3),1),N(T(i,1:3),2),u(T(i,1:3)),u(T(i,1:3)));
%  patch(N(T(i,1:3),1),N(T(i,1:3),2),u(T(i,1:3)),u(T(i,1:3)),'EdgeColor','none');
end;

colorbar;