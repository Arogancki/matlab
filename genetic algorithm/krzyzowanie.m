function [ plecaki ] = krzyzowanie( plecaki, prawdopodobienstwo, max_ladownosc_plecaka)
    for i=1:size(plecaki,1)
        if (rand<=prawdopodobienstwo)
           %indexy od 0/max
           podzialP1=mod(ceil((1+(rand*100))*size(plecaki(i,:,1),2)),size(plecaki(i,:,:),2)+1);
           %indexy od 0/max ale zawsze p1:p2>=max 
           %(ilosc przedmiotow sie nie zmniejsszy)
           podzialP2=size(plecaki(i,:,1),2)-podzialP1+mod(ceil((1+(rand*100))*size(plecaki(i,:,1),2)),podzialP1+1);
           partner=1+mod(ceil((1+(rand*100))*size(plecaki(:,:,:),1)),size(plecaki(:,:,:),1));
           dziecko=[plecaki(i,1:podzialP1,:) plecaki(partner,end-podzialP2+1:end,:)];
           if (sum(dziecko(1,:,1))<=max_ladownosc_plecaka)
               plecaki(i,1:size(dziecko(1,:,1),2),:)=dziecko(1,1:end,:);
           end
        end
    end
end