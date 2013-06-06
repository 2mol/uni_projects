function [ result ] = f( q,k )

eps=.001;

result=q(k+1)+q(k-1)-2*q(k)   -   eps/4*(q(k+1)^2-2*q(k+1)*q(k)+2*q(k)*q(k-1)-q(k-1)^2);

end