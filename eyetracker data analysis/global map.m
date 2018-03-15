clear all
close all
clc
gazedata=csvread('test_1\gazedata.csv',1,0);
sessions =  importdata('test_1\sessions.csv');
%ses=csvread('test_1\sessions.csv',[0 0 1 1]);
file = 'img_rank/a041f.jpg';
%file = 'img_rank/a057f.jpg';

[w k]=size(sessions.textdata);
for i=1:w
    if (strcmp(sessions.textdata{i,4},file) && str2num(sessions.textdata{i,3})==1)
        ankietowni=str2num(sessions.textdata{i,2});
        ankietowany_zdjecie(ankietowni,1)=str2num(sessions.textdata{i,6});
        ankietowany_zdjecie(ankietowni,2)=str2num(sessions.textdata{i,7});
        ankietowany_zdjecie(ankietowni,3)=str2num(sessions.textdata{i,8});
        ankietowany_zdjecie(ankietowni,4)=str2num(sessions.textdata{i,9});
    elseif (strcmp(sessions.textdata{i,10},file) && str2num(sessions.textdata{i,3})==2)
        ankietowni=str2num(sessions.textdata{i,2});
        ankietowany_zdjecie(ankietowni,1)=sessions.data(i,1);
        ankietowany_zdjecie(ankietowni,2)=sessions.data(i,2);
        ankietowany_zdjecie(ankietowni,3)=sessions.data(i,3);
        ankietowany_zdjecie(ankietowni,4)=sessions.data(i,4);
    end
end

fileIMG=imread(file);  % ladowanie obrazu
[fw fk]=size(fileIMG);
fk=fk/3;

[w k]=size(ankietowni);
for i=1:w
    odpowiedzi_ankietowanego_indexy=find(gazedata(:,1)==ankietowni(i));
    [ww kk]=size(odpowiedzi_ankietowanego_indexy);
    for j=1:ww
       odpowiedzi_ankietowanego(j,1)=gazedata(odpowiedzi_ankietowanego_indexy(j,1),3); 
       odpowiedzi_ankietowanego(j,2)=gazedata(odpowiedzi_ankietowanego_indexy(j,1),4); 
    end
    
    [ww kk]=size(odpowiedzi_ankietowanego);
    subplot(w,2,(i*2)-1);
    image(fileIMG);
    subplot(w,2,(i*2));
    maska=zeros(ankietowany_zdjecie(ankietowni,3)-ankietowany_zdjecie(ankietowni,1),...
        ankietowany_zdjecie(ankietowni,4)-ankietowany_zdjecie(ankietowni,2));
    for j=1:ww
        if (ankietowany_zdjecie(ankietowni,1)<=odpowiedzi_ankietowanego(j,1) && ...
            odpowiedzi_ankietowanego(j,1)<= ankietowany_zdjecie(ankietowni,3) && ...
             ankietowany_zdjecie(ankietowni,2)<=odpowiedzi_ankietowanego(j,2) && ...
            odpowiedzi_ankietowanego(j,2)<= ankietowany_zdjecie(ankietowni,4) )
        
            maska(odpowiedzi_ankietowanego(j,1)-ankietowany_zdjecie(ankietowni,1),...
                odpowiedzi_ankietowanego(j,2)-ankietowany_zdjecie(ankietowni,2))=1;
        end
    end
    %przeskalowanie maski do rozmiarow obrazu
    
    maska=imresize(maska,[fw fk],'nearest');
    [www kkk]=size(maska);
    maska2=zeros(www,kkk);
    horizont=20;
    for q=1:www
        for a=1:kkk
            if maska(q,a)>0
                xs=-1;
                ys=-1;
               for promien=1:001:horizont
                    for qq=0:001:360
                        xxxx=floor(promien*cos(qq)+q);
                        yyyy=floor(promien*sin(qq)+a);
                        if (xxxx>0 && yyyy>0 && xxxx<=www && yyyy<=kkk && (xs~=xxxx || ys~=yyyy))
                            maska2(xxxx, yyyy)=maska2(xxxx, yyyy)+1;
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
    mapa=fileIMG;
    [www kkk]=size(fileIMG);
    kkk=floor(kkk/3);
    for q=1:www
        for a=1:kkk
            if (maska2(q,a)>0)
                mapa(q,a,1)=fileIMG(q,a,1)+maska2(q,a);
                mapa(q,a,2)=fileIMG(q,a,2)+255-maska2(q,a);
                mapa(q,a,3)=fileIMG(q,a,3);
            end
        end
    end
    image(mapa);
end