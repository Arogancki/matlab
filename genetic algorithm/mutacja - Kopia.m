function [ plecaki ] = mutacja( plecaki, prawdopodobienstwo, max_ladownosc_plecaka, przedmioty)
    for i=1:size(plecaki,1);
        for j=1:size(plecaki(i,:,1),2);
            if (rand<=prawdopodobienstwo) % czy kolejny przedmiot w plecaku mutuje
                if (plecaki(i,j,1)==0) %nie ma przedmiotu
                    nowyPrzedmiot=mod(ceil((1+(rand*100))*size(przedmioty(:,:),1)),size(przedmioty(:,:),1))+1;
                    dziecko=plecaki(i,:,:);
                    dziecko(1,1,1)=przedmioty(nowyPrzedmiot,1);
                    dziecko(1,1,2)=przedmioty(nowyPrzedmiot,2);
                    if (sum(dziecko(1,:,1))<=max_ladownosc_plecaka)
                        plecaki(i,:,:)=dziecko(1,:,:); % jesli dziecko nie przekroczylo to ok
                    end
                else
                    plecaki(i,j,:)=[0 0]; % usunieto bo byl
                end
            end
        end
    end
end