clear all
close all
clc
gazedata=csvread('test_1\gazedata.csv',1,0);
sessions =  importdata('test_1\sessions.csv');
zdjecia=zeros(800/5*25,1300/5*25,3);
[w k]=size(gazedata);
for i=1:gazedata(end,1);
    index=find(str2double(sessions.textdata(:,2))==i);
    xs=str2double(sessions.textdata(index,6));
    xk=sessions.data(i,3);
    ys=str2double(sessions.textdata(index,7));
    yk=sessions.data(i,4);
    maska=zeros((yk-ys),(xk-xs));
    indexx=find(gazedata(:,1)==index);
    [www kkk]=size(indexx);
    for j=1:www
        if (gazedata(indexx(j),3)-xs+1>=1 &&...
            gazedata(indexx(j),3)-xs<=(xk-xs) &&...
            gazedata(indexx(j),4)-ys+1>=1 &&...
            gazedata(indexx(j),4)-ys<=(yk-ys))
            maska(gazedata(indexx(j),4)-ys,gazedata(indexx(j),3)-xs)=...
                maska(gazedata(indexx(j),4)-ys,gazedata(indexx(j),3)-xs)+1;
        end
    end
    
    [www kkk]=size(maska);
    maska2=zeros(www,kkk);
    horizont=10;
    for q=1:www
        for a=1:kkk
           for  v=1:maska(q,a)
                xs=-1;
                ys=-1;
                for promien=1:001:horizont
                    for qq=0:001:360
                        xxxx=floor(promien*cos(qq)+q);
                        yyyy=floor(promien*sin(qq)+a);
                        if (xxxx>0 && yyyy>0 && xxxx<=www && yyyy<=kkk && (xs~=xxxx || ys~=yyyy))
                            maska2(xxxx, yyyy)=maska2(xxxx, yyyy)+(horizont-promien);
                            xs=xxxx;
                            yx=yyyy;
                        end
                    end
                end
            end 
        end
    end
    %przelozenie na kolory
    maska2=(maska2/max(max(maska2))).*255; %normalizacja
    [www kkk]=size(maska2);
    maska3=zeros(www,kkk,3);
    maska3(:,:,1)=maska2;
    maska3(:,:,2)=(255-maska2).*(maska2>0);
    %maska3=imresize(maska3,0.2);
    [wwww kkkk]=size(maska3);
    kkkk=kkkk/3;
    zdjecia((ceil(i/5)*wwww)-wwww+1:(ceil(i/5)*wwww), (mod(i-1,5)*kkkk)+1:(mod(i-1,5)*kkkk)+kkkk,:)=...
        zdjecia((ceil(i/5)*wwww)-wwww+1:(ceil(i/5)*wwww), (mod(i-1,5)*kkkk)+1:(mod(i-1,5)*kkkk)+kkkk,:)+maska3(:,:,:);
end
image(uint8(zdjecia));