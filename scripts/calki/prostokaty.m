%calki - prostokaty

%i = input('podaj funkcje: ', 's');
%F = inline(i);
%p = input('podaj poczatek przedzialu : ')
%k = input('podaj koniec przedzialu : ')

F=@(x) x.^cos(x);
p=1;
k=3;

%odleglosc miedzy punktami punktami
epsi=0.01;

%ilosc prostokatow
N=0;
for i=p:0.01:k
	N=N+1;
end

prostokat=0; %cale pole - calka
for i=1:N
    prostokat=prostokat + F(p + i * epsi);
end
prostokat=prostokat*epsi