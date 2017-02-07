clc
clear all

% podstawowy obraz
obraz=imread('1.png')  % ladowanie obrazu
x = input('Dawaj liczbe do wyjebania')
image(obraz)


subplot(3,4,1)
obraz1 = 0.2126* obraz(:,:,1) + 0.7152 * obraz(:,:,2) + 0.0722 * obraz(:,:,3)
image(obraz1)

llll

% do widma
subplot(3,4,3)
widmo=fftshift(fft(obraz1));
image(real(widmo));

%operacje na stalej charmonicznej
[Jw Kw]=obliczJK(ifft(ifftshift(widmo)))

widmoTESTT=widmo;
widmoTESTT(1,1)=widmoTESTT(1,1)+25;
[Jp5 Kp5]=obliczJK(ifft(ifftshift(widmoTESTT)))

widmoTESTT=widmo;
widmoTESTT(1,1)=widmoTESTT(1,1)+50;
[Jp25 Kp25]=obliczJK(ifft(ifftshift(widmoTESTT)))

widmoTESTT=widmo;
widmoTESTT(1,1)=widmoTESTT(1,1)*4;
[Jx4 Kx4]=obliczJK(ifft(ifftshift(widmoTESTT)))

widmoTESTT=widmo;
widmoTESTT(1,1)=widmoTESTT(1,1)*7;
[Jx7 Kx7]=obliczJK(ifft(ifftshift(widmoTESTT)))

% do noramlnosci
subplot(3,4,4);
powrot=ifft(ifftshift(widmo));
%powrot=((powrot-(min(min(powrot))))/max(max(powrot))).*255;
image(real(powrot));

%BUDUJEMY maske 1
[w k]=size(widmo);
maska1=zeros(w,k);
w1=w/2.35;
k1=k/2.25;
maska1(1:w1,1:k1)=1;
maska1(1:w1,end-k1+1:end)=1;
maska1(end-w1+1:end,end-k1+1:end)=1;
maska1(end-w1+1:end,1:k1)=1;

%BUDUJEMY maske 2
maska2=~maska1;

%Budujemy maske 3
maska3=zeros(w,k);
w1=w/2.35;
k1=k/2.25;
maska3(1:w1,1:k1)=1;
maska3(1:w1,end-k1+1:end)=1;
maska3(end-w1+1:end,end-k1+1:end)=1;
maska3(end-w1+1:end,1:k1)=1;
rw1=70; %% rozmiary "paska"
rk1=70;
maska3(1:w1-rw1,1:k1-rk1)=0;
maska3(1:w1-rw1,end-k1+rk1+1:end)=0;
maska3(end-w1+rw1+1:end,end-k1+rk1+1:end)=0;
maska3(end-w1+rw1+1:end,1:k1-rk1)=0;

%Budujemy maske 4
maska4=~maska3;

%drukowanie masek

subplot(3,4,5);
m1obraz=widmo.*maska1;
image(real(m1obraz));

subplot(3,4,6);
m2obraz=widmo.*maska2;
image(real(m2obraz));

subplot(3,4,7);
m3obraz=widmo.*maska3;
image(real(m3obraz));

subplot(3,4,8);
m4obraz=widmo.*maska4;
image(real(m4obraz));

%Wyswietlenie obrazu (troche krawedziowanie) po nalozeniu maski na widmo
subplot(3,4,9);
powrotM1=ifft(ifftshift(m1obraz));
%powrotM1=((powrotM1-(min(min(powrotM1))))/max(max(powrotM1))).*255;
image(abs(real(powrotM1)));

subplot(3,4,10);
powrotM2=ifft(ifftshift(m2obraz));
%powrotM2=((powrotM2-(min(min(powrotM2))))/max(max(powrotM2))).*255;
image(abs(real(powrotM2)));

subplot(3,4,11);
powrotM3=ifft(ifftshift(m3obraz));
%powrotM3=((powrotM3-(min(min(powrotM3))))/max(max(powrotM3))).*255;
image(abs(real(powrotM3)));

subplot(3,4,12);
powrotM4=ifft(ifftshift(m4obraz));
%powrotM4=((powrotM4-(min(min(powrotM4))))/max(max(powrotM4))).*255;
image(abs(real(powrotM4)));

colormap(gray(256));