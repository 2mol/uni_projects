function Me=Elementmassenmatrix(N,T,el);
%% Berechnet die Elementmassenmatrix fuer das
%% Element el 
% Das Integral muss man bei Hand berechnen
 %Phi_1=1-x-y, Phi_2=x, Phi_3=y
 Me=abs(((N(T(el,2),1)-N(T(el,1),1))*(N(T(el,3),2)-N(T(el,1),2))...
-(N(T(el,3),1)-N(T(el,1),1)*(N(T(el,2),2)-N(T(el,1),1)))))*...
[1/24 -1/24 -1/24; -1/24 1/3 1/2;-1/24 1/2 1/3];