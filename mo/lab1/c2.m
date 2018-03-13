a= [1 1 2;
    2 1 4;
    3 0 6];

rank(a); %rzad macierzy
sum(eig(a)); % warotsci wlasne macierzy
poly(a); % wspolczynik wielomianu charakterystycznego
trace(a)