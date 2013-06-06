function [ p,q ] = phi2( p0,q0,t )

% nur noch explizit euler
eps=1;

N=length(p0);

p=zeros(1,N);

q=q0;
p(1)=0;
p(N)=0;

for i=2:N-1
	p(i)=p0(i)+t*eps/4*((q(i+1)-q(i))^2-(q(i)-q(i-1))^2);
end

end

