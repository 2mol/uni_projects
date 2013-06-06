function [Nr,Tr,Pr]=GitVerfeinerung(N,T,P)
%% Gitterverfeinerung
% N - Knoten
% T - Dreiecke
% P - Materialkonstanten

t=size(T,1);
k=size(N,1)+1;

Nr=N;
Tr=zeros(4*t,6);
Pr=zeros(1,4*t);
newpts=zeros(3,2);


for i=1:size(T,1),
    %%TODO: uebernehme Materialkonstanten
    for m=1:4
        Pr(4*(i-1)+m)=P(i);
	%Pr(4*(i-1)+(1:4)*(i-1)+4)=P(i);
    end
    
    % uebernehme die guten alten Punkte, mit Randinfos
	Tr(4*(i-1)+1,1)=T(i,1);
    Tr(4*(i-1)+1,4)=T(i,4);
    Tr(4*(i-1)+1,6)=T(i,6);
    
	Tr(4*(i-1)+3,2)=T(i,2);
    Tr(4*(i-1)+3,4)=T(i,4);
    Tr(4*(i-1)+3,5)=T(i,5);
    
	Tr(4*(i-1)+4,3)=T(i,3);
    Tr(4*(i-1)+4,5)=T(i,5);
    Tr(4*(i-1)+4,6)=T(i,6);

    % Die 3 potentiellen neuen Punkte:
	newpts(1,1)=(N(T(i,1),1)+N(T(i,2),1))/2; newpts(1,2)=(N(T(i,1),2)+N(T(i,2),2))/2;
	newpts(2,1)=(N(T(i,3),1)+N(T(i,2),1))/2; newpts(2,2)=(N(T(i,3),2)+N(T(i,2),2))/2;
	newpts(3,1)=(N(T(i,1),1)+N(T(i,3),1))/2; newpts(3,2)=(N(T(i,1),2)+N(T(i,3),2))/2;
    
    % Vermeide doppeltes Registrieren von Punkten:
	for j=1:3
		dupe=find(ismember(Nr,newpts(j,:),'rows'));
		if isempty(dupe)
			Nr(k,:)=newpts(j,:);
            
			%Fallunterscheidung; haesslich, aber funktionniert:
            if j==1,
				Tr(4*(i-1)+1,2)=k;
				Tr(4*(i-1)+2,1)=k;
				Tr(4*(i-1)+3,1)=k;
			elseif j==2
				Tr(4*(i-1)+3,3)=k;
				Tr(4*(i-1)+2,2)=k;
				Tr(4*(i-1)+4,2)=k;
			else
				Tr(4*(i-1)+1,3)=k;
				Tr(4*(i-1)+2,3)=k;
				Tr(4*(i-1)+4,1)=k;
            end
			k=k+1;
		else
			if j==1,
				Tr(4*(i-1)+1,2)=dupe;
				Tr(4*(i-1)+2,1)=dupe;
				Tr(4*(i-1)+3,1)=dupe;
			elseif j==2
				Tr(4*(i-1)+3,3)=dupe;
				Tr(4*(i-1)+2,2)=dupe;
				Tr(4*(i-1)+4,2)=dupe;
			else
				Tr(4*(i-1)+1,3)=dupe;
				Tr(4*(i-1)+2,3)=dupe;
				Tr(4*(i-1)+4,1)=dupe;
			end
		end
	end
end