a=[-5 -100 0 0; 
    0.5 -1.15 -1.1 0.15;
    0 0 -0.04 0;
    0 0.0055 0.0036 -0.0063];
det(a); % wyznacznik
eig(a); % wartosci wlasne
inv(a); % macierz odwerotna
triu(a); % maciez torjkatna gorna
tril(a); % macierz trojkatna dolna 
trace(a)