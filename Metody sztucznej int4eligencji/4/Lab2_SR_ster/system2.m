function y = system2(x)

x1 = x(1);
x2 = x(2);

mi_m1 = trapez(x1, 18, 18, 25, 35);
mi_d1 = trojkat(x1, 25, 35, 50);
mi_s1 = trapez(x1, 35, 50, 60, 70);
mi_e1 = trapez(x1, 60, 70, 80, 80);

mi_m2 = trojkat(x2, 0, 0, 50);
mi_s2 = trojkat(x2, 0, 50, 100);
mi_d2 = trojkat(x2, 50, 100, 150);
mi_bd2 = trojkat(x2, 100, 150, 150);

oz = 0;
niski = 0.2;
sredni = 0.5;
duzy = 1;

% dla oz
mi_oz =     max([ min(mi_d1,mi_m2) min(mi_s1,mi_m2) min(mi_d1,mi_s2) ]);

% dla niski
mi_niski =  max([ min(mi_m1,mi_m2) min(mi_s1,mi_s2) min(mi_d1,mi_d2) ]);

% dla sredni
mi_sredni = max([ min(mi_e1,mi_m2) min(mi_m1,mi_s2) min(mi_s1,mi_d2) min(mi_d1,mi_bd2) ]);

% dla duzy
mi_duzy =   max([ min(mi_e1,mi_s2) min(mi_m1,mi_d2) min(mi_e1,mi_d2) min(mi_m1,mi_bd2) ...
                 min(mi_s1,mi_bd2) min(mi_e1,mi_bd2) ]);

suma = mi_oz + mi_niski + mi_sredni + mi_duzy;

if suma==0
   y = 0;
else 
   y = (oz*mi_oz + niski*mi_niski + sredni*mi_sredni + duzy*mi_duzy)/suma;
end
