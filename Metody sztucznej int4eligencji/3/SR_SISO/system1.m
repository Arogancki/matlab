function y = system1(x)

mi_bm = trapez(x, 0, 0, 25, 35);
mi_m = trojkat(x, 25, 35, 45);
mi_s = trojkat(x, 35, 45, 55);
mi_st = trojkat(x, 45, 55, 65);
mi_bst = trapez(x, 55, 65, 80, 80);

suma = mi_bm + mi_m + mi_s + mi_st + mi_bst;

if suma==0
   y = 0;
else 
   y = (mi_bm*0.2 + mi_m*0.4 + mi_s*1 + mi_st*0.8 + mi_bst*0.6)/suma;
end
