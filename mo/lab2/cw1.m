clc
clear all
format long e

N=308;
s=0;

%fast factorial algorithm matlab
%fact trzeba stworzyc sswoja funckje

x=10;
for k=0:1:N
    s=s+x^k/fact(k);
end
s