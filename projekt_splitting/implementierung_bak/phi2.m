function [ p,q ] = phi2( p0,q0,t )
%Eigentlich nur noch explizit euler



N=length(p0);

p=zeros(1,N);

q=q0;
p(1)=0;
p(N)=0;
p(N-1)=p0(N-1)+t*(q(N-2)-eps/4*((q(N-1)-q(N-2))^2));

% p(1)=p0(1)+t*(q(1+1)+eps/4*((q(1+1)-q(1))^2));
% p(N)=p0(N)+t*(q(N-1)-eps/4*((q(N)-q(N-1))^2));
% p(N-1)=p0(N-1)+t*(q(N-2)-eps/4*((q(N-1)-q(N-2))^2));

for i=2:N-2
    p(i)=p0(i)+t*(q(i+1)+q(i-1)-eps/4*((q(i)-q(i-1))^2-(q(i+1)-q(i))^2));
%p(i)=p0(i)+t*(q(i+1)+q(i-1)-eps/4*(q(i+1)-q(i-1))*(q(i-1)+q(i+1)+2*q(i)));
end

end

