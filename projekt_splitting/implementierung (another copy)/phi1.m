function [ p,q ] = phi1( p0,q0,t )

N=length(q0);

blah=zeros(N);

P=zeros(N);
P(1,1)=0;
P(end,end)=0;

for i=2:N-1
    P(i,i)=-2;
    P(i,i-1)=1;
    P(i,i+1)=1;
end

% P=-2*eye(N-2)+diag(ones(1,N-3),1)+diag(ones(1,N-3),-1);

Q=eye(N);

A=[blah P; Q blah];

y0=[p0 q0]';
y=expm(A*t)*y0;

p=y(1:N);
p(1)=0; p(end)=0;
q(1)=0; q(end)=0;
q=y(N+1:end);

end