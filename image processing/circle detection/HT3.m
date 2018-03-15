function [ oUt ] = HT3( IMG, r, R,N )
colormap(gray(256));
IN = 0.2126* IMG(:,:,1) + 0.7152 * IMG(:,:,2) + 0.0722 * IMG(:,:,3);

IN=double(IN);

out1=FP(IN,[-1, 0, 1; -1, 0,1;-1,0,1] );
out2=FP(IN,[-1, -1, -1; 0, 0,0;1,1,1]  );
out3=FP(IN,[0, 1, 1; -1, 0,1;-1,-1,0]);
out4=FP(IN,[-1, -1, 0; -1, 0,1;0,1,1]  );

out=sqrt((out1.*out1)+(out2.*out2)+(out3.*out3)+(out4.*out4));

out=out>50;
%subplot(1,3,2);
image(out*255);

[w k]=size(out);
licznik=1;
out2=out*0;
for p=r:R
    
    %p=80
    kolo=zeros((p*2-1),(p*2-1));
    for i=0:360%*10000
        kolo( ceil(p*cos(i))+p, ceil(p*sin(i))+p  )=1;
    end
    %image(kolo*255)
   % bzdury
    
    %[wM kM]=size(kolo);
    ilosc=sum(sum(kolo));
    for i=p+1:w-p
        for j=p+1:k-p
            aktualnie=sum(sum(kolo&out((i-p):(i+p-1),(j-p):(j+p-1))))/ilosc;
            if (aktualnie>0.87)
                out2((i-p):(i+p-1),(j-p):(j+p-1))=out2((i-p):(i+p-1),(j-p):(j+p-1))|kolo;
                PRAW(1,licznik)=p; %promien
                PRAW(2,licznik)= aktualnie;% prawdopodobienstwo kola
                PRAW(3,licznik)=i; %srodek kola x
                PRAW(4,licznik)=j; %srodek kola y
                licznik=licznik+1;
            end
        end
    end
           
end
subplot(1,3,3);
image(out2*255);
oUt=sort(PRAW,2);
oUt=oUt(:,end-N+1:end);

colormap(gray(256));
end