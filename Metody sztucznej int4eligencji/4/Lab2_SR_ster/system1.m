function y = system1(x)

sl = trojkat(x, -180, -180, -60);
bl = trojkat(x, -180, -120, -60);
l  = trojkat(x, -120, -60, 0);
ok = trojkat(x, -10, 0, 10);
r  = trojkat(x, 0, 60, 120);
br = trojkat(x, 60, 120, 180);
sr = trojkat(x, 60, 180, 180);

suma = sl + bl + l + ok + r + br + sr;

if suma==0
   y = 0;
else 
   y = (sl*-20 + bl*-18 + l*-15 + ok*0 + r*15 + br*18 + sr*20)/suma;
end
