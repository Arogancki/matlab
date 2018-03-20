clear
clc

Z = [   6       0.4     15      70  14;
        14      0.6     13      40  17;
        17      0.4     15      80  14.5;
        14.5    0.7     11      50  20;
        20      1       10      40  21.6;
        21.6    1.2     10      50  23;
        23      1       7       80  24.5;
        24.5    1.5     6       100 28;
        28      1.5     8       110 26.4;
        26.4    1.7     5       80  29]

RR = corrcoef(Z);
R0 = RR(1:4,5);
RR = RR(1:4,1:4);

x1 = Z(:,1);
x2 = Z(:,2);
x3 = Z(:,3);
x4 = Z(:,4);

subplot(2,3,1);
plot(x1, x2, 'p');
title(['R12 ' num2str(RR(1,2))]);
subplot(2,3,2);
plot(x1, x3, 'p');
title(['R12 ' num2str(RR(1,3))]);
subplot(2,3,3);
plot(x1, x4, 'p');
title(['R12 ' num2str(RR(1,4))]);
subplot(2,3,4);
plot(x2, x3, 'p');
title(['R12 ' num2str(RR(2,3))]);
subplot(2,3,5);
plot(x2, x4, 'p');
title(['R12 ' num2str(RR(2,4))]);
subplot(2,3,6);
plot(x3, x4, 'p');
title(['R12 ' num2str(RR(3,4))]);
figure
subplot(2,2,1);
plot(Z(:,1), Z(:,5), 'p');
title(['R12 ' num2str(R0(1))]);
subplot(2,2,2);
plot(Z(:,2), Z(:,5), 'p');
title(['R12 ' num2str(R0(2))]);
subplot(2,2,3);
plot(Z(:,3), Z(:,5), 'p');
title(['R12 ' num2str(R0(3))]);
subplot(2,2,4);
plot(Z(:,4), Z(:,5), 'p');
title(['R12 ' num2str(R0(4))]);

%x1
H1=(R0(1)^2) / ( abs( RR(1,1) ) );
K1=H1

%x2
H1=(R0(2)^2) / ( abs( RR(2,2) ) );
K2=H1

%x3
H1=(R0(3)^2) / ( abs( RR(3,3) ) );
K3=H1

%x4
H1=(R0(4)^2) / ( abs( RR(4,4) ) );
K4=H1

%x1x2
H1=(R0(1)^2) / ( abs( RR(1,1)) + abs( RR(2,1) ) ) ;
H2=(R0(2)^2) / ( abs( RR(1,2)) + abs( RR(2,2) ) ) ;
K5=H1+H2

%x1x3
H1=(R0(1)^2) / ( abs( RR(1,1)) + abs( RR(3,1) ) ) ;
H2=(R0(3)^2) / ( abs( RR(1,3)) + abs( RR(3,3) ) ) ;
K6=H1+H2

%x1x4
H1=(R0(1)^2) / ( abs( RR(1,1)) + abs( RR(4,1) )  );
H2=(R0(4)^2) / ( abs( RR(1,4)) + abs( RR(4,4) )  );
K7=H1+H2

%x2x3
H1=(R0(2)^2) / ( abs( RR(2,2)) + abs( RR(3,2) ) ) ;
H2=(R0(3)^2) / ( abs( RR(2,3)) + abs( RR(3,3) ) ) ;
K8=H1+H2

%x2x4
H1=(R0(2)^2) / ( abs( RR(2,2)) + abs( RR(4,2) ) ) ;
H2=(R0(4)^2) / ( abs( RR(2,4)) + abs( RR(4,4) ) ) ;
K9=H1+H2

%x3x4
H1=(R0(3)^2) / ( abs( RR(3,3)) + abs( RR(4,3) ) ) ;
H2=(R0(4)^2) / ( abs( RR(3,4)) + abs( RR(4,4) ) ) ;
K10=H1+H2

%x1x2x3
H1=(R0(1)^2) / ( abs( RR(1,1)) + abs( RR(2,1) ) + abs( RR(3,1) ) ) ;
H2=(R0(2)^2) / ( abs( RR(1,2)) + abs( RR(2,2) ) + abs( RR(3,2) ) ) ;
H3=(R0(3)^2) / ( abs( RR(1,3)) + abs( RR(2,3) ) + abs( RR(3,3) ) ) ;
K11=H1+H2+H3

%x1x2x4
H1=(R0(1)^2) / ( abs( RR(1,1)) + abs( RR(2,1) ) + abs( RR(4,1) ) ) ;
H2=(R0(2)^2) / ( abs( RR(1,2)) + abs( RR(2,2) ) + abs( RR(4,2) ) ) ;
H3=(R0(4)^2) / ( abs( RR(1,4)) + abs( RR(2,4) ) + abs( RR(4,4) ) ) ;
K12=H1+H2+H3

%x1x3x4
H1=(R0(1)^2) / ( abs( RR(1,1)) + abs( RR(3,1) ) + abs( RR(4,1) ) ) ;
H2=(R0(3)^2) / ( abs( RR(1,3)) + abs( RR(3,3) ) + abs( RR(4,3) ) ) ;
H3=(R0(4)^2) / ( abs( RR(1,4)) + abs( RR(3,4) ) + abs( RR(4,4) ) ) ;
K13=H1+H2+H3

%x2x3x4
H1=(R0(2)^2) / ( abs( RR(2,2)) + abs( RR(3,2) ) + abs( RR(4,2) ) );
H2=(R0(3)^2) / ( abs( RR(2,3)) + abs( RR(3,3) ) + abs( RR(4,3) ) );
H3=(R0(4)^2) / ( abs( RR(2,4)) + abs( RR(3,4) ) + abs( RR(4,4) ) );
K14=H1+H2+H3

%x1x2x3x4
H1= R0(1)^2 / ( abs(RR(1,1)) + abs(RR(2,1)) + abs(RR(3,1)) + abs(RR(4,1)) );
H2= R0(2)^2 / ( abs(RR(1,2)) + abs(RR(2,2)) + abs(RR(3,2)) + abs(RR(4,2)) );
H3= R0(3)^2 / ( abs(RR(1,3)) + abs(RR(2,3)) + abs(RR(3,3)) + abs(RR(4,3)) );
H4= R0(4)^2 / ( abs(RR(1,4)) + abs(RR(2,4)) + abs(RR(3,4)) + abs(RR(4,4)) );
K15=H1+H2+H3+H4
