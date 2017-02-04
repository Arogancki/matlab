function [ plecaki ] = inwersja( plecaki, prawdopodobienstwo)
    for i=1:size(plecaki,1);
        if (rand<=prawdopodobienstwo)
           podzial_start=mod(ceil((1+(rand*100))*size(plecaki(i,:,1),2)),size(plecaki(i,:,1),2)-1)+1;
           podzial_stop=podzial_start+1+mod(ceil((1+(rand*100))*size(plecaki(i,:,1),2)),size(plecaki(i,:,1),2)-podzial_start);
           plecaki(i,:,1)=[plecaki(i,1:podzial_start-1,1) fliplr(plecaki(i,podzial_start:podzial_stop,1)) plecaki(i,podzial_stop+1:end,1)];
           plecaki(i,:,2)=[plecaki(i,1:podzial_start-1,2) fliplr(plecaki(i,podzial_start:podzial_stop,2)) plecaki(i,podzial_stop+1:end,2)];
        end
    end
end