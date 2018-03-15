clc
clear all
close all

X = input('X = ');
y = input('Y = ');

%X=[32 24 25 36 74 76 98];
%y=[55 32 24 53 64 76 55];

if length(X) ~= length(y)
    error('zle dane')
    return
end

n=length(X);
for i=1:n
    for j=1:n
    v(i,j)=(X(i))^(j-1);
    end
end

a=inv(v)*y'
a=a';

x=(min(X):0.01:max(X));
m=length(a);
n=length(x);
for i=1:n
    w=0;
    for j=1:m
        w=w+(a(j)*(x(i)^(j-1)));
    end
    f(i)=w;
end

hold on
plot(x,f,'b-')
plot(X,y,'ro')
xlabel 'Os X'
ylabel 'Os Y'
title('Interpolacja');
hold off

