a=  imread('a.jpg');  % ladowanie obrazu

subplot(2,3,1) % wykres
image(a) % wyswietlanie obrazu
axis equal; % piksel zawsze = kwadratem



% okienko 2
b = 0.2126* a(:,:,1) + 0.7152 * a(:,:,2) + 0.0722 * a(:,:,3); % wyciagniecie kanalu  RGB

subplot(2,3,2)
image(b)
axis equal; % piksel zawsze = kwadratem



% okienko 3
b = 0.299 * a(:,:,1) + 0.587 * a(:,:,2) + 0.114 * a(:,:,3); % wyciagniecie kanalu  RGB

subplot(2,3,3)
image(b)
axis equal; % piksel zawsze = kwadratem




% wyciagniecie pojedynczych warsty

% okienko 4
colormap(gray(256)) % interpretacja konkretnej warsty koloru

c = a(:,:,1); % wyciagniecie kanalu  R

subplot(2,3,4)
image(c)
axis equal; % piksel zawsze = kwadratem

% okienko 5
c =  a(:,:,2); % wyciagniecie kanalu  g

subplot(2,3,5)
image(c)
axis equal; % piksel zawsze = kwadratem

% okienko 6
c = a(:,:,3); % wyciagniecie kanalu b

subplot(2,3,6)
image(c)
axis equal; % piksel zawsze = kwadratem




colormap(gray(256)) % interpretacja konkretnej warsty koloru