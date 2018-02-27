
i=1;
for a = [2, 2.9, 3, 3.56, 3.6];
    p(1) = 0.1;
    for n = 2:200;
        p(n) = a * p(n-1) * (1 - p(n-1));
    end
    subplot(5,1,i) % 5 na 1 i numer teraz i
    plot(p) % rysowanie
    i=i+1;
end