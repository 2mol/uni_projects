function [ p,q ] = phi1( p0,q0,t )

N=length(q0);

a=sqrt(2);

p=p0*cos(a*t)-q0*sin(a*t)*a;
q=p0*sin(a*t)/a+q0*cos(a*t);

%% Rand

% p(1)=p0(1)*cos(t)-q0(1)*sin(t);
% q(1)=p0(1)*sin(t)+q0(1)*cos(t);
% 
% p(N-1)=p0(N-1)*cos(t)-q0(N-1)*sin(t);
% q(N-1)=p0(N-1)*sin(t)+q0(N-1)*cos(t);

p(1)=0; p(N)=0;
q(1)=0; q(N)=0;


% for j=1:N
%     for k=1:j-1
%         a=2*(j-k);
%         p(j)=p(j)+(p0(k)*t^a )/factorial(a)+(q0(k)*t^(a-1) )/factorial(a-1);
%         q(j)=q(j)+(p0(k)*t^(a+1) )/factorial(a+1)+(q0(k)*t^a )/factorial(a);
%     end
%     p(j)=p(j)+p0(j);
%     q(j)=q(j)+p0(j)*t+q0(j);
% end

end