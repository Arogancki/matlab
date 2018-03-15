b=  imread('a.png');  % ladowanie obrazu

b = 0.2126* b(:,:,1) + 0.7152 * b(:,:,2) + 0.0722 * b(:,:,3); % wyciagniecie kanalu  RGB
a=(double(b));

%podstawowy
[J K]=obliczJK(a);
b=Norm(a);
subplot(2,5,1);
image(b) % wyswietlanie obrazu
title('Podstawowy');
xlabel(['J=',num2str(J),'   ','K=',num2str(K)]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

% *2
[J K]=obliczJK(a.*2);
b=Norm(a.*2);
subplot(2,5,2);
image(b) % wyswietlanie obrazu
title('*2');
xlabel(['J=',num2str(J),'   ','K=',num2str(K)]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

% *10000
[J K]=obliczJK(a.*10000);
b=Norm(a.*10000);
subplot(2,5,3);
image(b) % wyswietlanie obrazu
title('*23');
xlabel(['J=',num2str(J),'   ','K=',num2str(K)]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

% /13
[J K]=obliczJK(a./13);
b=Norm(a./13);
subplot(2,5,4);
image(b) % wyswietlanie obrazu
title('/13');
xlabel(['J=',num2str(J),'   ','K=',num2str(K)]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

% +599
[J K]=obliczJK(a+599);
b=Norm(a+599);
subplot(2,5,5);
image(b) % wyswietlanie obrazu
title('+599');
xlabel(['J=',num2str(J),'   ','K=',num2str(K)]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

% -100
[J K]=obliczJK(a-100);
b=Norm(a-100);
subplot(2,5,6);
image(b) % wyswietlanie obrazu
title('-100');
xlabel(['J=',num2str(J),'   ','K=',num2str(K)]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

% log
[J K]=obliczJK(log(a));
b=Norm(log(a));
subplot(2,5,7);
image(b) % wyswietlanie obrazu
title('log');
xlabel(['J=',num2str(J),'   ','K=',num2str(K)]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

% ^2
[J K]=obliczJK(a.^2);
b=Norm(a.^2);
subplot(2,5,8);
image(b) % wyswietlanie obrazu
title('\^2');
xlabel(['J=',num2str(J),'   ','K=',num2str(K)]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

% ^4
[J K]=obliczJK(a.^4);
b=Norm(a.^4);
subplot(2,5,9);
image(b) % wyswietlanie obrazu
title('\^4');
xlabel(['J=',num2str(J),'   ','K=',num2str(K)]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

% sqrt(2)
b=((a.*(-1))+255);
subplot(2,5,10);
image(b) % wyswietlanie obrazu
colormap(gray(256)) % interpretacja konkretnej warsty koloru
dddd
[J K]=obliczJK(sqrt(a));
b=Norm(sqrt(a));
subplot(2,5,10);
image(b) % wyswietlanie obrazu
title('sqrt(2)');
xlabel(['J=',num2str(J),'   ','K=',num2str(K)]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem


colormap(gray(256)) % interpretacja konkretnej warsty koloru