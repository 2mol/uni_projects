% Implementierung Fermi-Pasta-Ulam
% yay
clear all; close all; clc;

N=32;

n=200; % Anzahl Schritte; Perioden
T=200*pi/sin(pi/(2*N)); % Intervalllänge
h=T/n; %Schrittweite

t=0:h:T;

q0=zeros(1,N+1);
p0=zeros(1,N+1);

for i=2:N
    q0(i)=sqrt(2/N)*sin((i-1)*pi/N);
end

% plot(q0) 

p=zeros(n+1,N+1);
q=zeros(n+1,N+1);

p(1,:)=p0;
q(1,:)=q0;

%% Explizit Euler:

for j=1:n % Zeitschritt
    for k=2:N % Schritte durch die einzelnen Komponenten
        p(j+1,k)=p(j,k)+h*f(q(j,:),k);
    end
    for k=2:N % Schritte durch die einzelnen Komponenten
        q(j+1,k)=q(j,k)+h*p(j,k);
    end
end

Hexp=zeros(1,n+1);
for j=1:n+1
    Hexp(j)=H(p(j,:),q(j,:));
end

Eexp=zeros(1,n+1);
for j=1:n+1
    Eexp(j)=E(p(j,:),q(j,:));
end

%% Symplektisch Euler:

for j=1:n % Zeitschritt
    for k=2:N % Schritte durch die einzelnen Komponenten
        p(j+1,k)=p(j,k)+h*f(q(j,:),k);
    end
    for k=2:N % Schritte durch die einzelnen Komponenten
        q(j+1,k)=q(j,k)+h*p(j+1,k);
    end
end

Hsym=zeros(1,n+1);
for j=1:n+1
    Hsym(j)=H(p(j,:),q(j,:));
end

Esym=zeros(1,n+1);
for j=1:n+1
    Esym(j)=E(p(j,:),q(j,:));
end

%% Strang-Splitting

for j=1:n
    p0=p(j,:);
    q0=q(j,:);
    [p0,q0]=phi2(p0,q0,h/2);
    [p0,q0]=phi1(p0,q0,h);
    [p0,q0]=phi2(p0,q0,h/2);
    p(j+1,:)=p0;
    q(j+1,:)=q0;
end

Hstr=zeros(1,n+1);
for j=1:n+1
    Hstr(j)=H(p(j,:),q(j,:));
end

%% Plottiplot


plot(t,Hsym,'-.b')
h = legend('Symplektisch Euler');

% plot(t,Hexp,'-g',t,Hsym,'-.b',t,Hstr,'r')
% h = legend('Explizit Euler','Symplektisch Euler','Strang-Splitting',2);
set(h,'Interpreter','none')

% plot(t,Hexp,'-g',t,Hsym,'-.b')
% h = legend('explizit','symplektisch','lie-splitting',2);
% set(h,'Interpreter','none')

% figure
% plot(t,Esym,t,Eexp)