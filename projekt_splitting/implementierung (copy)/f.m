function [ result ] = f( q,k )

eps=1;

result=q(k+1)+q(k-1)-2*q(k) - eps/4*((q(k)-q(k-1))^2-(q(k+1)-q(k))^2);

end
