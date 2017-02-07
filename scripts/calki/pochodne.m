clc
close
clear all


%i = input('podaj funkcje: ', 's');
%F = inline(i);
%p = input('podaj poczatek przedzialu : ')
%k = input('podaj koniec przedzialu: ')


F=@(x) x.^cos(x);
p=0;
k=10;


x=p:0.01:k;

%rysowanie funckji
fun=@(x) (x.^(cos(x))).*((cos(x)./x)-log(x).*sin(x));

hold on
plot(x,F(x), 'b')

plot(x,fun(x),'g')

h=0.1;
% wzor 2 punktowy
x2=(p+h):0.1:(k-h);
y2=(F(x2+h)-F(x2))./(h); 
plot(x2, y2, 'c')

% wzor 3 punktowy
x3=(p+h):0.1:(k-h); 
y3=(F(x3+h)-F(x3-h))./(2*h);
plot(x3, y3, 'm')


% wzor 5 punktowy
x5=(p+(2*h)):0.1:(k-(2*h));
y5=(F(x5-2*h)-8.*F(x5-h)+8.*F(x5+h)-F(x5+(2*h)))./(12*h);
plot(x5, y5, 'y')

legend('Funkcja ','pochodna analityczna - fun(x)', '2-punktowy', '3-punktowy', '5-punktowy')


grid on
hold off