function [ Macierz ] = wystep( IMG, N, GORA, PRAWO, display )

L=linspace(0,256,N+1);

IMG2=IMG;
for i=1:N   
    IMG2( IMG>=L(i) & IMG<=L(i+1) )=i;
end

[WE WY]=WEWY(IMG2,GORA,PRAWO);

wielkosc=max(max(IMG));
Macierz =zeros(wielkosc);
for i=1:wielkosc
     for j=1:wielkosc
        Macierz(i,j)=sum(sum((WE == i)&(WY == j)));
     end
end

if display
    image(Norm(Macierz))
    colormap(gray(256)) % interpretacja konkretnej warsty koloru
end

end

