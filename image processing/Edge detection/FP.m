function [ OUT ] = FP( IN,M )

IN=double(IN);
NORM=sum(sum(M));
if (NORM==0)
    NORM=1;
end

[wM kM]=size(M);
mw=ceil(wM/2);
kw=ceil(kM/2);

%srodek i od gory do okola abcd

a=mw-1;
c=wM-mw;
d=kw-1;
b=kM-kw;

[w k]=size(IN);
A1=zeros(a,d)+IN(1,1);
A2=zeros(a,k);
for i=1:k
   A2(:,i)=A2(:,i)+IN(1,i);
end
A3=zeros(a,b)+IN(1,end);
A4=zeros(w,d);
for i=1:w
   A4(i,:)=A4(i,:)+IN(i,1);
end
A5=zeros(w,b);
for i=1:w
   A5(i,:)=A5(i,:)+IN(i,end);
end
A6=zeros(c,d)+IN(end,1);
A7=zeros(c,k);
for i=1:k
   A7(:,i)=A7(:,i)+IN(end,i);
end
A8=zeros(c,b)+IN(end,end);

A=[ A1, A2, A3; A4, IN, A5; A6, A7, A8];
OUT=IN;

for i=1:w
    for j=1:k
        OUT(i,j)=sum(sum(A((0:wM-1)+i,(0:kM-1)+j).*M))/NORM;
    end
end

end