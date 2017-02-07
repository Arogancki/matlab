clc
clear all

obraz=  imread('1.png');  % ladowanie obrazu
%subplot(1,3,1);
%image(obraz);
roz=HT3(obraz,10,30,15);
axis equal; % piksel zawsze = kwadratem
roz