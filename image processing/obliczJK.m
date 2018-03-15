function [ J, K ] = obliczJK( a )

n=size(a); % rozmiar (macierz szerokosc, wysokosc)

J = (1/(n(1)*n(2)))*(sum(sum(a)));

K = sqrt( (1/(n(1)*n(2)))*(sum(sum((a-J).^2))) );

end