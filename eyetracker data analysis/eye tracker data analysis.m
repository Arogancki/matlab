clear all
close all
clc
gazedata=csvread('test_1\gazedata.csv',1,0);
sessions =  importdata('test_1\sessions.csv');
%file = 'img_rank/a041f.jpg';
file = 'img_rank/a057f.jpg';
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
            odpowiedzi_ankietowanego(j,1)<=ankietowany_zdjecie(ankietowni,3) && ...
            ankietowany_zdjecie(ankietowni,2)<=odpowiedzi_ankietowanego(j,2) && ...
            odpowiedzi_ankietowanego(j,2)<=ankietowany_zdjecie(ankietowni,4) )
        
           maska(odpowiedzi_ankietowanego(j,1)-ankietowany_zdjecie(ankietowni,1),...
                odpowiedzi_ankietowanego(j,2)-ankietowany_zdjecie(ankietowni,2))=1;
        end
    end
    [fw fk]=size(fileIMG);
    image(imresize(maska,[fw fk],'nearest').*255)
    colormap(gray(256)) % interpretacja konkretnej warsty koloru
end
