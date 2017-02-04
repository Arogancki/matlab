clear all
close all
clc
gazedata=csvread('test_1\gazedata.csv',1,0);
sessions =  importdata('test_1\sessions.csv');
file = 'img_rank/c049f.jpg';
file2 ='img_rank/a054f.jpg';

[w k]=size(sessions.textdata);
for i=1:w
    if ((strcmp(sessions.textdata{i,4},file) && strcmp(sessions.textdata{i,10},file2)) ||...
        (strcmp(sessions.textdata{i,10},file) && strcmp(sessions.textdata{i,4},file)) )
        ankietowni=str2num(sessions.textdata{i,2});
        ankietowany_zdjecie2(ankietowni,1)=sessions.data(i,1);
        ankietowany_zdjecie2(ankietowni,2)=sessions.data(i,2);
        ankietowany_zdjecie2(ankietowni,3)=sessions.data(i,3);
        ankietowany_zdjecie2(ankietowni,4)=sessions.data(i,4);
        ankietowany_zdjecie(ankietowni,1)=str2num(sessions.textdata{i,6});
        ankietowany_zdjecie(ankietowni,2)=str2num(sessions.textdata{i,7});
        ankietowany_zdjecie(ankietowni,3)=str2num(sessions.textdata{i,8});
        ankietowany_zdjecie(ankietowni,4)=str2num(sessions.textdata{i,9});
    end
end

fileIMGG=uint8(zeros(ankietowany_zdjecie2(ankietowni,4)-ankietowany_zdjecie(ankietowni,2),...
    ankietowany_zdjecie2(ankietowni,3)-ankietowany_zdjecie(ankietowni,1),3));

fileIMG=imresize(imread(file),[ankietowany_zdjecie(ankietowni,4)-ankietowany_zdjecie(ankietowni,2)...
     ankietowany_zdjecie(ankietowni,3)-ankietowany_zdjecie(ankietowni,1)]);  % ladowanie obrazu
fileIMG2=imresize(imread(file2),[ankietowany_zdjecie2(ankietowni,4)-ankietowany_zdjecie2(ankietowni,2)...
     ankietowany_zdjecie2(ankietowni,3)-ankietowany_zdjecie2(ankietowni,1)]);  % ladowanie obrazu


[wwwww kkkkk]=size(fileIMG);
kkkkk=kkkkk/3;
fileIMGG(1:wwwww,1:kkkkk,:)=fileIMGG(1:wwwww,1:kkkkk,1:3)+fileIMG(1:wwwww,1:kkkkk,1:3);
fileIMGG(1:wwwww,end-kkkkk+1:end,:)=fileIMGG(1:wwwww,end-kkkkk+1:end,1:3)+fileIMG2(1:wwwww,1:kkkkk,1:3);

[w k]=size(ankietowni);
for i=1:w
    odpowiedzi_ankietowanego_indexy=find(gazedata(:,1)==ankietowni(i));
    [ww kk]=size(odpowiedzi_ankietowanego_indexy);
    for j=1:ww
       odpowiedzi_ankietowanego(j,1)=gazedata(odpowiedzi_ankietowanego_indexy(j,1),3); 
       odpowiedzi_ankietowanego(j,2)=gazedata(odpowiedzi_ankietowanego_indexy(j,1),4); 
    end
    [ww kk]=size(odpowiedzi_ankietowanego);
    image(flipdim(fileIMGG,1));
    image(fileIMGG)
    hold on
    [www kkk]=size(fileIMGG);
    kkk=kkk/3;
    popx=odpowiedzi_ankietowanego(1,1)-ankietowany_zdjecie(ankietowni,1);
    popy=odpowiedzi_ankietowanego(1,2)-ankietowany_zdjecie(ankietowni,2);
    plot(popx,popy,'*r');
    for j=2:ww
        odpowiedzi_ankietowanego(j,1)=odpowiedzi_ankietowanego(j,1)-ankietowany_zdjecie(ankietowni,1);
        odpowiedzi_ankietowanego(j,2)=odpowiedzi_ankietowanego(j,2)-ankietowany_zdjecie(ankietowni,2);
        if (odpowiedzi_ankietowanego(j,1)>=0 && odpowiedzi_ankietowanego(j,1) <=kkk && odpowiedzi_ankietowanego(j,2)>=0 && odpowiedzi_ankietowanego(j,2)<=www)
            plot(odpowiedzi_ankietowanego(j,1),odpowiedzi_ankietowanego(j,2),'*r');
            line([popx, odpowiedzi_ankietowanego(j,1)],[popy odpowiedzi_ankietowanego(j,2)],'Color','b');
            popx=odpowiedzi_ankietowanego(j,1);
            popy=odpowiedzi_ankietowanego(j,2);
        end
    end
    hold off
end
