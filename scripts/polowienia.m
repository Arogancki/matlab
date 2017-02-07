clc
clear all
close all

i = input('podaj funkcje: ', 's');
F = inline(i);
a = input('podaj a: ');
b = input('podaj b: ');

%F=@(x) (exp(x))+(x.^2)-2;
%a=0;
%b=1;

epsi = 0.001;
ilosc = a:0.01:b;

x(1) = (a*F(b) - b*F(a))./(F(b)-F(a));
i=1;
while abs(F(x(i))) >= epsi
    fa = F(a)*F(x(i));
    fb = F(b)*F(x(i));
    if fa < 0
        b = x(i);
    else
        a = x(i);
    end
    i=i+1;
    x(i) = (a+b)/2;
end

x(i)
i
hold on
plot(ilosc, F(ilosc))
plot(x, 0, 'x')
hold off

