function y = system2(x)

x1 = x(1);
x2 = x(2);

Bbl = trapez(x1, -180, -180, -40, -20);
Bl = trojkat(x1, -40, -20, 0);
Bo = trojkat(x1, -20, 0, 20);
Bp  = trojkat(x1, 0, 20, 40);
Bbp = trojkat(x1, 20, 40, 180);

Pu = trapez(x2, -0.4, -0.4, -0.1, 0);
Po = trojkat(x2, -0.1, 0, 0.1);
Pd = trapez(x2, 0, 0.1, 0.4, 0.4);

Kbls = -20;
Kls = -15;
Kos = 0;
Kps = 15;
Kbps = 20;

%{
Kbl = sum(Pu*Bbl + Pu*Bl);
Kl = sum(Po*Bbl + Po*Bl);
Ko = sum(Pd*Bbl + Pd*Bl + Pu*Bo + Po*Bo + Pd*Bo + Pu*Bp + Pu*Bbp);
Kp = sum(Po*Bbp + Po*Bp);
Kbp = sum(Pd*Bbp + Pd*Bp);
%}

Kbl = max(Pu*Bbl + Pu*Bl);
Kl = max(Po*Bbl + Po*Bl);
Ko = max(Pd*Bbl + Pd*Bl + Pu*Bo + Po*Bo + Pd*Bo + Pu*Bp + Pu*Bbp);
Kp = max(Po*Bbp + Po*Bp);
Kbp = max(Pd*Bbp + Pd*Bp);


suma = Kbl + Kl + Ko + Kp + Kbp;

if suma==0
   y = 0;
else 
   y = (Kbl*Kbls + Kl*Kls + Ko*Kos + Kp*Kps + Kbp*Kbps)/suma;
end
