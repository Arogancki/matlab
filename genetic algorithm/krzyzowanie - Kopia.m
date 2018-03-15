function [ plecaki ] = krzyzowanie( plecaki, prawdopodobienstwo, max_ladownosc_plecaka)
    for i=1:size(plecaki,1);
        if (rand<=prawdopodobienstwo)
           podzial=mod(ceil((1+(rand*100))*size(plecaki(i,:,1),2)),size(plecaki(i,:,1),2));
           partner=mod(ceil((1+(rand*100))*size(plecaki(:,:,:),1)),size(plecaki(:,:,:),1))+1;
           dziecko=[plecaki(i,1:podzial,:) plecaki(partner,podzial+1:end,:)];
           if (sum(dziecko(1,:,1))<=max_ladownosc_plecaka)
               plecaki(i,:,:)=dziecko(1,:,:);
           end
        end
    end
end