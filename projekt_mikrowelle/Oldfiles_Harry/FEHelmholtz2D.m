function u=FEHelmholtz2D(g,N,T,w,P);
%% FE Loeser fuer die Helmholtz-Glg

% Assemblierung
[A,M,b]=AssembHelmholtz2D(g,N,T,P);

% Loesung des Gleichungssystems
u=(A+w^2*M)\b;