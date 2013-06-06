function u=FEHelmholtz(g,N,T,w,P);
%% FE Loeser fuer die Helmholtz-Glg

% Assemblierung
[A,M,b]=AssembHelmholtz2D(g,N,T,P);

% Loesung des Gleichungssystems
u=(A+w^2*M)\b;

% A = full(A);
% M = full(M);
% save my_A.dat -ASCII A
% save my_M.dat -ASCII M