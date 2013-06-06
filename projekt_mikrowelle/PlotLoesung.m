function PlotLoesung(u,N,T,P)
%% Plot die Loesung u fuer die 
%% Triangulierung N,T

hold on;
view (-30,30);
trisurf(T(:,1:3),N(:,1),N(:,2),u,'LineStyle','none');

% color map und shading/lighting
colormap(hot);
shading interp;
lighting phong;
light('Position',[0 0 1],'Style','infinite');
light('Position',[-3 1 3],'Style','infinite');

% zeichne der Fisch am boden
X=[N(T(:,1),1)';N(T(:,2),1)';N(T(:,3),1)'];
Y=[N(T(:,1),2)';N(T(:,2),2)';N(T(:,3),2)'];

% schoene scalling von P
Q=abs(real(P));
fMaxQ=max(Q);
if fMaxQ > 0
  Q=Q*max(u)/fMaxQ;
end
patch(X,Y,min(u)*ones(size(X)),Q,'LineStyle','none');

% colorbar und grid lines
grid;colorbar;

title('Elektrisches Feld E_3 [V/m]');
xlabel('X');
ylabel('Y');
zlabel('Re(E_3)','Rotation',0);

hold off;