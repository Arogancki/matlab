clc
%clear all

M1=[-1,0;1,0];
M2=[-1,1; 0,0];
M3=[0,1; -1,0];
M4=[1 ,0 ;0 ,-1];
M5=[ -1,-1,2; -1,2,-1; 2,-1,-1 ];
M6=[2,-1,-1; -1,2,-1; -1,-1,2];
M7=[ -2,-1,0; -1,0,1; 0,1,2 ];
M8=[ 0,1,0; 1,-4,1; 1,1,1 ];
M9=[ 1,1,1; 1,-8,1; 1,1,1  ];
M10=[-1,0,1; -1,0,1; -1,0,1];
M11=[ -1,-1,-1; 0,0,0; 1,1,1 ];
M12=[ 0,1,1; -1,0,1; -1,-1,0  ];
M13=[ -1,-1,0; -1,0,1; 0,1,1  ];
M14=[ -3,-3,5; -1,0,5; -3,-3,5  ];
M15=[ -3,5,5; -3,0,5; -3,-3,-3  ];
M16=[5,5,5; -3,0,-3; -3,-3,-3];
M17=[5,5,-3; 5,0,-3; -3,-3,-3];
M18=[ 5,-3,-3; 5,0,-3; 5,-3,-3 ];
M19=[-3,-3,-3; 5,0,-3; 5,5,-3];
M20=[-3,-3,-3; -3,0,-3; 5,5,5];
M21=[-3,-3,-3; -3,0,5; -3,5,5];

obraz=  imread('1.png');  % ladowanie obrazu
obraz = 0.2126* obraz(:,:,1) + 0.7152 * obraz(:,:,2) + 0.0722 * obraz(:,:,3); % wyciagniecie kanalu  RGBtitle('This is my Figure')

figure(1);
set(gcf,'numbertitle','off','name','Filtracja rozciagniecie') % See the help for GCF

out=FP(obraz,M1);
subplot(5,5,1);
image(out)
title('M1');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP(obraz,M2);
subplot(5,5,2);
image(out)
title('M2');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP(obraz,M3);
subplot(5,5,3);
image(out)
title('M3');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP(obraz,M4);
subplot(5,5,4);
image(out)
title('M4');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP(obraz,M5);
subplot(5,5,5);
image(out)
title('M5');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP(obraz,M6);
subplot(5,5,6);
image(out)
title('M6');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP(obraz,M7);
subplot(5,5,7);
image(out)
title('M7');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP(obraz,M8);
subplot(5,5,8);
image(out)
title('M8');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP(obraz,M9);
subplot(5,5,9);
image(out)
title('M9');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP(obraz,M10);
subplot(5,5,10);
image(out)
title('M10');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP(obraz,M11);
subplot(5,5,11);
image(out)
title('M11');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP(obraz,M12);
subplot(5,5,12);
image(out)
title('M12');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP(obraz,M13);
subplot(5,5,13);
image(out)
title('M13');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP(obraz,M14);
subplot(5,5,14);
image(out)
title('M14');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP(obraz,M15);
subplot(5,5,15);
image(out)
title('M15');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP(obraz,M16);
subplot(5,5,16);
image(out)
title('M16');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP(obraz,M17);
subplot(5,5,17);
image(out)
title('M17');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP(obraz,M18);
subplot(5,5,18);
image(out)
title('M18');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP(obraz,M19);
subplot(5,5,19);
image(out)
title('M19');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP(obraz,M20);
subplot(5,5,20);
image(out)
title('M20');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP(obraz,M21);
subplot(5,5,21);
image(out)
title('M21');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

colormap(gray(256));


figure(2);
set(gcf,'numbertitle','off','name','Filtracja lustro') % See the help for GCF

out=FP2(obraz,M1);
subplot(5,5,1);
image(out)
title('M1');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP2(obraz,M2);
subplot(5,5,2);
image(out)
title('M2');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP2(obraz,M3);
subplot(5,5,3);
image(out)
title('M3');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP2(obraz,M4);
subplot(5,5,4);
image(out)
title('M4');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP2(obraz,M5);
subplot(5,5,5);
image(out)
title('M5');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP2(obraz,M6);
subplot(5,5,6);
image(out)
title('M6');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP2(obraz,M7);
subplot(5,5,7);
image(out)
title('M7');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP2(obraz,M8);
subplot(5,5,8);
image(out)
title('M8');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP2(obraz,M9);
subplot(5,5,9);
image(out)
title('M9');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP2(obraz,M10);
subplot(5,5,10);
image(out)
title('M10');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP2(obraz,M11);
subplot(5,5,11);
image(out)
title('M11');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP2(obraz,M12);
subplot(5,5,12);
image(out)
title('M12');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP2(obraz,M13);
subplot(5,5,13);
image(out)
title('M13');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP2(obraz,M14);
subplot(5,5,14);
image(out)
title('M14');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP2(obraz,M15);
subplot(5,5,15);
image(out)
title('M15');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP2(obraz,M16);
subplot(5,5,16);
image(out)
title('M16');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP2(obraz,M17);
subplot(5,5,17);
image(out)
title('M17');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP2(obraz,M18);
subplot(5,5,18);
image(out)
title('M18');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP2(obraz,M19);
subplot(5,5,19);
image(out)
title('M19');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP2(obraz,M20);
subplot(5,5,20);
image(out)
title('M20');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

out=FP2(obraz,M21);
subplot(5,5,21);
image(out)
title('M21');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal; % piksel zawsze = kwadratem

colormap(gray(256));


figure(3);
set(gcf,'numbertitle','off','name','Obraz wejœciowy') % See the help for GCF

image(obraz);
title('Obraz');
set(gca,'XTick',[]);
set(gca,'YTick',[]);
axis equal

colormap(gray(256));