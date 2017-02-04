function [ plecaki ] = mutacja( plecaki, prawdopodobienstwo, max_ladownosc_plecaka, przedmioty)
    for i=1:size(plecaki,1)
        if (rand<=prawdopodobienstwo)
        for j=1:size(plecaki(i,:,1),2)
            jeszcze_raz=1;
            while (jeszcze_raz)
                jeszcze_raz=0;
                if (rand<=prawdopodobienstwo) % czy kolejny przedmiot w plecaku mutuje
                    if (j>size(plecaki(i,:,1),2) || plecaki(i,j,1)==0) %nie ma przedmiotu
                        nowyPrzedmiot=mod(ceil((1+(rand*100))*size(przedmioty(:,:),1)),size(przedmioty(:,:),1))+1;
                        dziecko=plecaki(i,:,:);
                        dziecko(1,j,:)=przedmioty(nowyPrzedmiot,:);
                        if (sum(dziecko(1,:,1))<=max_ladownosc_plecaka)
                            plecaki(i,1:size(dziecko(1,:,1),2),:)=dziecko(1,1:end,:);
                            if j>=size(plecaki(i,:,1),2)
                                jeszcze_raz=1;
                                j=j+1;
                            end
                        end
                   else
                        plecaki(i,j,:)=[0 0]; % usunieto bo byl
                        if j>=size(plecaki(i,:,1),2)
                            jeszcze_raz=1;
                            j=j+1;
                        end
                    end
                end
            end
            end
        end
    end
end