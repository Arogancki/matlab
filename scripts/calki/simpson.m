%calki Simpson

%i = input('podaj funkcje: ', 's');
%F = inline(i);
%p = input('podaj poczatek przedzialu : ')
%k = input('podaj koniec przedzialu : ')

F=@(x) x.^cos(x);
p=1;
k=3;

%odleglosc miedzy punktami punktami
epsi=0.01; 

%ilosc podzialow
N=0;
for i=p:0.01:k
	N=N+1;
end

pole=0;
%suma wartoœci funkcji w punktach œrodkowych
ST=0; 
for i=1:N
	X=p+i.*epsi;
	ST=ST+F(X-(epsi./2));
	if i<N
		pole=pole+F(X);
	end
end
pole=(epsi/6).*(F(p)+F(k)+2.*pole+4.*ST)