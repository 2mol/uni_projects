% Implementierung Fermi-Pasta-Ulam
% yay
clear all; close all; clc;


%% Bedingungen 1
N=32;

k=200; % Anzahl Perioden
T=pi/sin(pi/(2*N)); % Periodenlänge
I=k*T; % totale Intervalllänge

% p=100; % Schritte pro Periode
% n=p*k; % Totalanzahl Schritte
n=25000; % Totalanzahl Schritte
n1=n;
h=I/n; % Schrittweite
h1=h

t1=0:h:I;

q0=zeros(1,N+1);
p0=zeros(1,N+1);

for i=1:N+1
    q0(i)=sqrt(2/N)*sin((i-1)*pi/N);
end

% plot(q0) 

p=zeros(n+1,N+1);
q=zeros(n+1,N+1);

p(1,:)=p0;
q(1,:)=q0;

%% Explizit Euler:

%for j=1:n % Zeitschritt
%    for k=2:N % Schritte durch die einzelnen Komponenten
%        p(j+1,k)=p(j,k)+h*f(q(j,:),k);
%    end
%    for k=2:N % Schritte durch die einzelnen Komponenten
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

%% Bedingungen 2
N=32;

k=200; % Anzahl Perioden
T=pi/sin(pi/(2*N)); % Periodenlänge
I=k*T; % totale Intervalllänge

% p=100; % Schritte pro Periode
% n=p*k; % Totalanzahl Schritte
n=1500; % Totalanzahl Schritte
n2=n;
h=I/n; % Schrittweite
h2=h

t2=0:h:I;

q0=zeros(1,N+1);
p0=zeros(1,N+1);

for i=1:N+1
    q0(i)=sqrt(2/N)*sin((i-1)*pi/N);
end

% plot(q0) 

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

%% Plottiplot

% plot(t,Hstr,'-b')
% h = legend('strang-splitting',2);
% set(h,'Interpreter','none')

p=plot(t1,Hsym,t2,Hstr);
set(p(1),'Color',[90 132 167]/255);
set(p(2),'Color',[255 20 20]/255);
xlabel('Zeit t')
ylabel('Energie H')
axis tight

h = legend(['Symplektisch Euler mit ' sprintf('%1.2g',n1) ' Schritten'],['Strang Splitting mit ' sprintf('%1.2g',n2) ' Schritten'],2);
set(h,'Interpreter','none')

% figure
% plot(t,Esym,t,Eexp)
