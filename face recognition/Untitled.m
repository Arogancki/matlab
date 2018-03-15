clc;
clear;
close all;

% ladowanie obrazu
obraz=imread('6.png');  
subplot(1,4,1)
colormap(gray(256));
image(obraz)
title('obraz');

% wyciagniecie przestrzeni HSV
hsv=rgb2hsv(obraz);
H = hsv(:, :, 1); % Hue image.
S = hsv(:, :, 2); % Saturation image.
V = hsv(:, :, 3); % Value (intensity) image.

% stworzenie maski
[w k]=size(H);
out =uint8(zeros(w,k));
for i=1:w
        for j=1:k
            if ( (H(i,j)<=0.4) || (H(i,j) >= 0.6)) && ((0.2<=S(i,j)) && (S(i,j)<=0.6)) && ((V(i,j)>=0.4))
                out(i,j)=256;
            end
        end
end
subplot(1,4,2);
image(out)
title('Maska');

%przeskalowanie maski
i=0.1;
out=imresize(out,i,'nearest');
out=medfilt2(out);
out=imresize(out,1/i,'nearest');
subplot(1,4,3);
image(out)
title('Maska po filtracji');

%ewentualne wyrownanie rozmiaru obrazu i maski
[w k]=size(out);
for i=1:3
    obraz(end:w,:,i) = 0;
    obraz(:,end:k,i) = 0;
end

%nalozenie maski na obraz
OUT(:,:,1)=obraz(:,:,1).*(out./256);
OUT(:,:,2)=obraz(:,:,2).*(out./256);
OUT(:,:,3)=obraz(:,:,3).*(out./256);
subplot(1,4,4);
image(OUT)
title('Wynik');
