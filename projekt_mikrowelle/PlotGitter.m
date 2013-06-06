function PlotGitter(N,T,P);
%% Visualisierung der Triangulierung
% N -> Liste von Knoten
% T -> Liste von Dreieck
% P -> Enthealt die Material-Konstanten

clf; axis('equal');

for i=1:size(T,1),
  % zeichne Flaeche Dreieck i
  if (abs(P(i)-8.85e-12.*pi*4e-7)<=1e-30)% Luft
  	patch(N(T(i,1:3),1),N(T(i,1:3),2),[153 192 227]/256);
  else % Fisch
  	patch(N(T(i,1:3),1),N(T(i,1:3),2),[1 0.7 0]);
  end
  
  line(N(T(i,1:2),1),N(T(i,1:2),2),'LineWidth',T(i,1+3)*2+1,'color',(1-T(i,4))*[1 1 1]);
  line(N(T(i,2:3),1),N(T(i,2:3),2),'LineWidth',T(i,2+3)*2+1,'color',(1-T(i,5))*[1 1 1]);
  line(N(T(i,[1 3]),1),N(T(i,[1 3]),2),'LineWidth',T(i,3+3)*2+1,'color',(1-T(i,6))*[1 1 1]);
end;

% schreibe die dazugehierige Nummer auf den Knoten
% falls Anzahl von Knoten <100
m=size(N,1);
if m<100,
  for i=1:m,
    % num2str->Nummer Knoten
    % N(i,1) x-Koord. Knoten i
    % N(i,2) y-Koord. Knoten i
	text(N(i,1),N(i,2),num2str(i));
  end;
end;