clear all
close all
clc
%dane
iloscPlecakow=50;
iloscPrzedmiotow=10;
obladowanie=0.1;
max_ladownosc_plecaka=550;
maxIteracji=10000;
minWartosc=530;
minObladowanie=0.96;
WI=1;%wlacznik warunku iteracji
WW=1;%wlacznik warunku wartosci
WO=1;%wlacznik warunku obladowania
prawdoK=0.2;
prawdoM=0.3;
prawdoI=0.2;
funkcjaSelekcji=0; %0 random 1 ruletka 2 turniej
rozmiarGrupyTurniejowej=ceil(iloscPlecakow/10);
wyswietl=1;
t=0.1; %pauza przy wyswietlaniu

%algorytm genetyczny
%stworzenie populacji poczatkowej
przedmioty=losuj_przedmioty(iloscPrzedmiotow);
%przedmioty=[1 2; 1 3; 2 5; 0.1 0];
plecaki=losuj_plecaki(iloscPlecakow, max_ladownosc_plecaka, obladowanie, przedmioty);
najlepszy1=wybor_najlepszego(plecaki,1); %wartosc
najlepszy2=wybor_najlepszego(plecaki,2); %zaladowanie

iteracja=0;
koniec=0;
while(~koniec)
    
    %selekcja chromosomow
    if funkcjaSelekcji==1
        plecaki=ruletka(plecaki);
    elseif funkcjaSelekcji==2
        plecaki=turniej(plecaki,rozmiarGrupyTurniejowej);
    elseif mod(ceil(rand*100),2)
        plecaki=ruletka(plecaki);
    else
        plecaki=turniej(plecaki,rozmiarGrupyTurniejowej);
    end
    
    %zastosowanie operatorow genetycznych
    plecaki=mutacja     (plecaki, prawdoM, max_ladownosc_plecaka, przedmioty);
    plecaki=krzyzowanie (plecaki, prawdoK, max_ladownosc_plecaka);
    plecaki=inwersja    (plecaki, prawdoI);
    
    %wybor najlepszych
    najlepszyZ=wybor_najlepszego(plecaki,1); %zaladowanie
    if sum(plecaki(najlepszyZ,:,1))/max_ladownosc_plecaka>=minObladowanie && WO
        disp('Osiagnieto zaladowanie');
        koniec=1;
    end
    
    najlepszyW=wybor_najlepszego(plecaki,2); %wartosc
    if sum(plecaki(najlepszyW,:,2))>=minWartosc && WW
        disp('Osiagnieto wartosc');
        koniec=1;
    end
    
    if iteracja>=maxIteracji && WI
         disp('Osiagnieto ilosc iteracji');
        koniec=1;
    end
    
    SW(iteracja+1)=sum(sum(plecaki(:,:,1)))/iloscPlecakow;
    NW(iteracja+1)=sum(plecaki(najlepszyZ,:,1));
    SWC(iteracja+1)=sum(sum(plecaki(:,:,2)))/iloscPlecakow;
    NWC(iteracja+1)=sum(plecaki(najlepszyW,:,2));
    
    %wykresy
    if wyswietl
        xAxis=0:iteracja;
        clf;
        hold on;
        subplot(2,2,1);
        plot(xAxis,SW);
        title(['Srednia waga ' num2str(SW(end))]);
        axis equal
    
        subplot(2,2,2);
        plot(xAxis,NW);
        title(['Najwieksza waga ' num2str(NW(end))]);
        axis equal
    
        subplot(2,2,3);
        plot(xAxis,SWC);
        title(['Srednia wartosc ' num2str(SWC(end))]);
        axis equal
    
        subplot(2,2,4);
        plot(xAxis,NWC);
        title(['Najwieksza wartosc ' num2str(NWC(end))]);
        axis equal
        hold off
        annotation('textbox', [0, 1, 0, 0], 'string', ['i=' num2str(iteracja(end))]);
        pause(t);
    end
    
    iteracja=iteracja+1;
end
disp(['Iteracja = ' num2str(iteracja) ...
    ' najlepszy zaladowany: ' num2str(najlepszyZ) ' = ' num2str(NW(end)) ...
    ', najwiecej warty: ' num2str(najlepszyW) ' = ' num2str(NWC(end)) '.'...
    ]);