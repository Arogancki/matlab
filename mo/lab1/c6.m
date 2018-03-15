clear
format long e

x=[exp(1), -pi, sqrt(2), -psi(1), log10(2)];
y=[1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049];

W1=sum(x.*y);

%w2
sum = 0;
for i=1:1:size(x)
    sum= sum + (x(i)*y(i));
end
W2 = sum;

%w3
sum = 0;
for i=size(x):-1:1
    sum= sum + (x(i)*y(i));
end
W3 = sum;

%w4
W4 = (x(2)*y(2)) + (x(3)*y(3)) + (x(1)*y(1)) + (x(5)*y(5)) + (x(4)*y(4));

b = [W1-W2, W1-W3, W1-W4];
b