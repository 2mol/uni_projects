function PlotGitter(N,T,P);
%% Visualisierung der Triangulierung
% N -> Liste von Knoten
% T -> Liste von Dreieck
% P -> Enthealt die Material-Konstanten

clf; axis('equal');

for i=1:size(T,1),
  % zeichne Flaeche Dreieck i
  if (abs(P(i)-8.85e-12.*pi*4e-7)<=1e-30)% Luft
    patch( .. , .. ,2),[1 1 0]);
  else % Fisch
    patch( .. , .. ,2),[173 255 47]/256);
  end
  
  for j=1:3,
    % zeichne Kanten Dreieck i
    line( .. , .. ,'LineWidth',T(i,j+3)*3+1);
  end;
end;

% schreibe die dazugehierige Nummer auf den Knoten
% falls Anzahl von Knoten <100
m=size(N,1);
if m<100,
  for i=1:m,
    % num2str->Nummer Knoten
    % N(i,1) x-Koord. Knoten i
    % N(i,2) y-Koord. Knoten i
     .. ;
  end;
end;