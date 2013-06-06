function [A,M,b]=AssembHelmoltz2D(g,N,T,P)
%% Assemblierung der Steifigkeitsmatrix A 
%% der Massmatrix M und des Lastvektors b 
% g -> Dirichlet-RB

n=size(T,1);
m=size(N,1);
A=sparse(m,m);
M=sparse(m,m);
bn=zeros(m,1);

for i=1:n,
  % Assemblierung, die Materiale-Konstanten nicht 
  % vergessen
  el=i;
  Ae=Elementsteifigkeitsmatrix(N,T,el);
  Me=P(el)* Elementmassenmatrix(N,T,el);
  % die Raender
  bn(T(i,1))=bn(T(i,1)) | T(i,4) | T(i,6);    
  bn(T(i,2))=bn(T(i,2)) | T(i,4) | T(i,5);
  bn(T(i,3))=bn(T(i,3)) | T(i,5) | T(i,6);
  A( T(el,1:3) , T(el,1:3) )=A( T(el,1:3) , T(el,1:3) )+Ae;     
  M( T(el,1:3),T(el,1:3) )=M( T(el,1:3) , T(el,1:3) )+Me;
end;

% Beruecksichtigung von Dirichlet-RB
b=zeros(m,1);
for j=1:m
    if bn(j)==1
        A(j,:)=0;
        A(j,j)= 1;
        M(j,:)=0;
        b(j)=feval(g,N(j,1),N(j,2));
    end
end
        



