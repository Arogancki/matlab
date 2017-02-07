%calki - trapezy

%i = input('podaj funkcje: ', 's');
%F = inline(i);
%p = input('podaj poczatek przedzialu : ')
%k = input('podaj koniec przedzialu : ')

F=@(x) x.^cos(x);
p=1;
k=3;

epsi=0.01; %odleglosc miedzy punktami punktami

%ilosc trapezow
N=0;
for i=p:0.01:k
	N=N+1;
end

trapez=0;
for i=1:N
    trapez=trapez + F(p + i.*epsi);
end
trapez=(trapez+(F(p)+F(k)./2)).*epsi