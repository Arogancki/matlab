function [ OUT ] = FP2( IN,M )

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
A1=fliplr(flipud(IN(1:a,1:d)));
A2=flipud(IN(1:a,1:k));
A3=fliplr(flipud(IN(1:a,end-b+1:end)));
A4=fliplr(IN(1:w,1:d));
A5=fliplr(IN(1:w,end-b+1:end));
A6=fliplr(flipud(IN(end-c+1:end,1:d)));
A7=flipud(IN(end-c+1:end,1:k));
A8=fliplr(flipud(IN(end-c+1:end,end-b+1:end)));
A=[ A1, A2, A3; A4, IN, A5; A6, A7, A8];

OUT=IN;
for i=1:w
    for j=1:k
        OUT(i,j)=sum(sum(A((0:wM-1)+i,(0:kM-1)+j).*M))/NORM;
    end
end

end