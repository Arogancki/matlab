a=[1 1 1;
    2 1 -1; 
    2 0 2]
det(a)

% policzyc wartosci wlasne i werktory wlasne
%odpowiednie elmenty do B

[V, D]= eigs(a);
det(inv(V)*a*V)
