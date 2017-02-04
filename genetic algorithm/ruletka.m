function [ plecaki ] = ruletka( plecaki2 )
    [temp indexy]=sort(sum(plecaki2(:,:,2),2));
    [ilosc temp]=size(indexy);
    suma=sum(indexy);
    %stworzenie kola-tarczy
    kolo=zeros(1,suma);
    s=1;
    k=1;
    for i=1:ilosc
        kolo(s:k)=i;
        s=k+1;
        k=s+i;
    end
    max=size(kolo,2);
    plecaki=plecaki2*0;
    for i=1:ilosc
        plecaki(i,:,:)=plecaki2(indexy(kolo(mod(ceil(rand*100*max),max-1)+1)),:,:);
    end
end