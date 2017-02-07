clc
%clear all

%lepsza jakosc

obraz=  imread('oko.png');  % ladowanie obrazu
obraz = 0.2126* obraz(:,:,1) + 0.7152 * obraz(:,:,2) + 0.0722 * obraz(:,:,3); % wyciagniecie kanalu  RGB
subplot(2,2,1);
image(obraz)

subplot(2,2,2);
Y=Norm(wystep(obraz, 256, 5, 14, 1));

%subplot(2,3,3);
%plot((1:size(Y)),Y)

axis equal
colormap(gray(256)) % interpretacja konkretnej warsty koloru

[W K]=size(Y);
r=W*K;

ostrosc=(sum(sum(Y))/r)/(sum(sum(Y==0))/r)
%(suma elementow/rozmiar)/(ilosc zer/rozmiar)

%gorsza jakosc

obraz=  imread('oko1.png');  % ladowanie obrazu
obraz = 0.2126* obraz(:,:,1) + 0.7152 * obraz(:,:,2) + 0.0722 * obraz(:,:,3); % wyciagniecie kanalu  RGB
subplot(2,2,3);
image(obraz)

subplot(2,2,4);
Y=Norm(wystep(obraz, 256, 5, 14, 1));

%subplot(2,3,6);
%plot((1:size(Y)),Y)

axis equal
colormap(gray(256)) % interpretacja konkretnej warsty koloru

[W K]=size(Y);
r=W*K;

ostrosc=(sum(sum(Y))/r)/(sum(sum(Y==0))/r)
%(suma elementow/rozmiar)/(ilosc zer/rozmiar)