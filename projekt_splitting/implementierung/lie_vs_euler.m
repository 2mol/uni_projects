% Implementierung Fermi-Pasta-Ulam
clear all; close all; clc;


%% Bedingungen 1
N=32;

k=200; % Anzahl Perioden
T=pi/sin(pi/(2*N)); % Periodenlänge
I=k*T; % totale Intervalllänge

n=15000; % Totalanzahl Schritte
n1=n;
h=I/n; % Schrittweite
h1=h;

t1=0:h:I;

q0=zeros(1,N+1);
p0=zeros(1,N+1);

for i=1:N+1
    q0(i)=sqrt(2/N)*sin((i-1)*pi/N);
end

p=zeros(n+1,N+1);
q=zeros(n+1,N+1);

p(1,:)=p0;
q(1,:)=q0;

%% Explizit Euler:

%for j=1:n % Zeitschritt
%    for k=2:N % Schritt durch die einzelnen Komponenten
%        p(j+1,k)=p(j,k)+h*f(q(j,:),k);
%    end
%    for k=2:N % Schritt durch die einzelnen Komponenten
%        q(j+1,k)=q(j,k)+h*p(j,k);
%    end
%end

%Hexp=zeros(1,n+1);
%for j=1:n+1
%    Hexp(j)=H(p(j,:),q(j,:));
%end

%Eexp=zeros(1,n+1);
%for j=1:n+1
%    Eexp(j)=E(p(j,:),q(j,:));
%end

%% Symplektisch Euler:
% 
% for j=1:n % Zeitschritt
%     for k=2:N % Schritt durch die einzelnen Komponenten
%         p(j+1,k)=p(j,k)+h*f(q(j,:),k);
%     end
%     for k=2:N % Schritt durch die einzelnen Komponenten
%         q(j+1,k)=q(j,k)+h*p(j+1,k);
%     end
% end
% 
% Hsym=zeros(1,n+1);
% for j=1:n+1
%     Hsym(j)=H(p(j,:),q(j,:));
% end
% 
% Esym=zeros(1,n+1);
% for j=1:n+1
%     Esym(j)=E(p(j,:),q(j,:));
% end

%% Störmer-Verlet:

p_tmp=zeros(1,N-1);
for j=1:n % Zeitschritt
    for k=2:N % Schritt durch die einzelnen Komponenten
        p_tmp(k)=p(j,k)+h/2*f(q(j,:),k);
    end
    for k=2:N % Schritt durch die einzelnen Komponenten
        q(j+1,k)=q(j,k)+h*p_tmp(k);
    end
    for k=2:N % Schritt durch die einzelnen Komponenten
        p(j+1,k)=p_tmp(k)+h/2*f(q(j+1,:),k);
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

%% Bedingungen 2
N=32;

k=200; % Anzahl Perioden
T=pi/sin(pi/(2*N)); % Periodenlänge
I=k*T; % totale Intervalllänge

n=1500; % Totalanzahl Schritte
%n=2000; % Totalanzahl Schritte
n2=n;
h=I/n; % Schrittweite
h2=h;

t2=0:h:I;

q0=zeros(1,N+1);
p0=zeros(1,N+1);

for i=1:N+1
    q0(i)=sqrt(2/N)*sin((i-1)*pi/N);
end

p=zeros(n+1,N+1);
q=zeros(n+1,N+1);

p(1,:)=p0;
q(1,:)=q0;

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

%% Bedingungen 3
N=32;

k=200; % Anzahl Perioden
T=pi/sin(pi/(2*N)); % Periodenlänge
I=k*T; % totale Intervalllänge

n=15000; % Totalanzahl Schritte
%n=2000; % Totalanzahl Schritte
n3=n;
h=I/n; % Schrittweite
h3=h;

t3=0:h:I;

q0=zeros(1,N+1);
p0=zeros(1,N+1);

for i=1:N+1
    q0(i)=sqrt(2/N)*sin((i-1)*pi/N);
end

p=zeros(n+1,N+1);
q=zeros(n+1,N+1);

p(1,:)=p0;
q(1,:)=q0;

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

Hstr2=zeros(1,n+1);
for j=1:n+1
    Hstr2(j)=H(p(j,:),q(j,:));
end

%% Plottiplot

p=plot(t1,Hsym,t2,Hstr,t3,Hstr2);
set(p(1),'Color',[90 132 167]/255);
set(p(2),'Color',[255 20 20]/255);
set(p(3),'Color',[0 0 0]/255);
xlabel('Zeit t')
ylabel('Energie H')
axis tight

h = legend(['Stormer-Verlet mit Schrittweite ' sprintf('%1.2g',h1)],['Strang Splitting mit Schrittweite ' sprintf('%1.2g',h2)],['Strang Splitting mit Schrittweite ' sprintf('%1.2g',h3)],3);
set(h,'Interpreter','none')
