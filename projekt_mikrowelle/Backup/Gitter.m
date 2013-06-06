function [N,T,P]=Gitter(G,w)
%% Gittererzeuger
% G -> Rechengebiet: 
% G=0  Einheitsquadrat
% G=1  Dreieck
% G=2  Viereck
% G=3  Fisch 
% w -> Frequenz der Glg
% N -> Liste von Knoten
% T -> Liste von Dreieck
% P -> Enthealt die Material-Konstanten

% Physikaliche Konstanten

 epsLuft=8.85e-12;
 muLuft=pi*4e-7;   
 sigmaLuft=0;
 
 epsFisch=6.44e-10;
 muFisch=pi*4e-7;   
 sigmaFisch=3e-11;

% Dreieck
 if G==1,      
   N=[0 0; 1 0; 0 1];
   T=[1 2 3 1 0 1];
   P= 1;

% Viereck=leere Mikrowelle
 elseif G==2                                         
   N=[0 0; 0.5 0; 0 0.3; 0.5 0.3];
   T=[1 2 3 1 0 1;
         2 3 4 0 1 1];
   P=muLuft*epsLuft*[1 1];

% Fisch in der Mikrowelle
 elseif G==3                                        
N=[.05 .02;.1 .1;.15 .05;.2 .03;.3 .04;
   .28 .02;.35 .05;.4 .1;.35 .15;.3 .18;
   .23 .25;.2 .19;.1 .15;.05 .25       % innen 14
   0 0; .05 0;.1 0;.15 0;.2 0;
   .28 0;.35 0;.4 0;.5 0;
   0 .02;.5 .1;.5 .15;
   0 .25;
   0 .3;.05 .3;.1 .3;.2 .3;.23 .3;.3 .3;.35 .3;.5 .3 
  ];
  
T=[1 2 14 0 0 0;2 13 14 0 0 0;
  2 3 13 0 0 0;3 12 13 0 0 0;
   3 4 12 0 0 0;4 10 12 0 0 0;
   4 5 10 0 0 0;5 7 9 0 0 0;
   5 9 10 0 0 0;7 8 9 0 0 0;
   6 7 5 0 0 0;12 10 11 0 0 0; 
   15 16 1 1 0 0;15 1 24 0 0 1;   % draussen
   16 17 1 1 0 0;17 2 1 0 0 0;
   17 3 2 0 0 0;17 18 3 1 0 0;
   18 19 4 1 0 0;18 4 3 0 0 0;
   19 20 6 1 0 0;19 6 4 0 0 0;6 5 4 0 0 0;
   20 21 6 1 0 0;21 7 6 0 0 0;
   21 22 7 1 0 0;22 8 7 0 0 0;
   22 23 25 1 1 0;22 25 8 0 0 0;
   24 1 14 0 0 0;24 14 27 0 0 1;
   8 25 26 0 1 0;8 26 9 0 0 0;
   27 14 29 0 0 0;27 29 28 0 1 1;
   14 30 29 0 1 0;14 13 30 0 0 0;
   13 31 30 0 1 0;13 12 31 0 0 0;
   12 11 31 0 0 0;11 32 31 0 1 0;
   11 33 32 0 1 0;11 10 33 0 0 0;
   10 9 34 0 0 0;10 34 33 0 1 0;
   9 26 35 0 1 0;9 35 34 0 1 0
  ];  
   
P=[muFisch*(epsFisch+sigmaFisch/(i*w))*ones(1,12) ... 
     muLuft*epsLuft*ones(1,35)];
     
% Einheitsquadrat
 else                                                
   N=[0 0; 1 0; 0 1 ; 1 1];
   T=[1 2 3 1 0 1 ; 2 4 3 1 1 0];
   P=[1 1];
 end;