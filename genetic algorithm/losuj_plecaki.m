function [ plecaki ] = losuj_plecaki(iloscPlecakow, ladownosc_plecaka, obladowanie, przedmioty)
%plecaki(:,:,:) numer_plecaka,numer_przedmiotu,waga/wartosc
plecaki=zeros(iloscPlecakow,0,2);
for i=1:iloscPlecakow
    numer_przedmiotu=1; % numer wrzucany do plecaka
    przedmioty2=przedmioty; % kopia do losowania zeby nie szukac w tych co sie juz nie mieszcza
    while size(przedmioty2,1)>1 % dopoki mam w czym losowac
        j=ceil(mod(100*rand,size(przedmioty2,1))); % losuje 
       if (sum(plecaki(i,:,1))+przedmioty2(j,1)<ladownosc_plecaka*obladowanie) %jesli sie miesci
          plecaki(i,numer_przedmiotu,:)=[przedmioty2(j,1) przedmioty2(j,2)]; %wrzucam do plecaka
          numer_przedmiotu=numer_przedmiotu+1; % incrementacja
       else
           %nie biore dodawanego przedmiotu pod uwage - nie miesci sie
           przedmioty2=[przedmioty2(1:j-1,:); przedmioty2(j+1:end,:)]; % usuwam z losowanyhch
       end
    end
end
end

