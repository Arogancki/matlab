clear all;
x1=[18:2:80];
x2=[0:10:150];

k=1;
for we1=x1
    p=1;
    for we2=x2
        ys(p,k) = system2([we1 we2]);
        p = p+1;
    end    
    k = k+1;
end

surf(x1,x2,ys);
view([10 30]);
grid;
