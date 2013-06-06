function [ result ] = E( p,q )

N=length(q);
r=zeros(1,N-1);

for i=1:N-1
    r(i)=q(i+1)-q(i);
end

% result=sum(p.^2)/2+sum(r.^2)/2+eps/12*sum(r.^3);
result=sum(p.^2)/2+sum(r.^2)/2;

end

