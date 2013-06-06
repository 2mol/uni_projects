function PlotFisch(u,N,T,P);
%% Plot die Loesung u fuer die 
%% Triangulierung N,T nur auf dem Fisch
                    
for i=1:size(T,1),
    if (abs(P(i)-8.85e-12.*pi*4e-7)<=1e-30) % Luft:
    % nichts
    else % Fisch:
        patch(N(T(i,1:3),1),N(T(i,1:3),2), ... 
        u(T(i,1:3)),u(T(i,1:3)),'EdgeColor','none');
    end
end;

colorbar;