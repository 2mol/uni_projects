function [ result ] = H( p, q )



N=length(q);
r=zeros(1,N-1);

p=p(1:end-1);

for i=1:N-1
    r(i)=q(i+1)-q(i);
end

result=sum(p.^2)/2+sum(r.^2)/2+eps*sum(r.^3)/12;
end