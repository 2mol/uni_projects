% Test

N = [0 0; 1 0; 0 1; 1 1];
T = [1 2 3 1 0 1; 2 4 3 1 1 0];
P = [1 1];

% PlotGitter(N,T,P)

[N, T, P] = GitVerfeinerung(N,T,P);

PlotGitter(N,T,P)

n = size(T, 1);
m = size(N, 1);
bn = zeros(m, 1);

for i=1:n
  % die Raender
  bn(T(i,1))=bn(T(i,1)) | T(i,4) | T(i,6);    
  bn(T(i,2))=bn(T(i,2)) | T(i,4) | T(i,5);
  bn(T(i,3))=bn(T(i,3)) | T(i,5) | T(i,6);
end;

