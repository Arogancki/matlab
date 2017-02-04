function [ plecaki ] = turniej( plecaki2, rozmiarGrupy)
plecaki=plecaki2*0;
    for i=1:size(plecaki2(:,:,:),1)
        grupa=zeros(rozmiarGrupy,size(plecaki2(:,:,:),2),2);
        for j=1:rozmiarGrupy
            grupa(j,:,:)=plecaki2(1+mod(ceil((1+(rand*100))*size(plecaki2(:,:,:),1)),size(plecaki2(:,:,:),1)),:,:);
        end
        plecaki(i,:,:)=grupa(wybor_najlepszego( grupa,2 ),:,:);
    end
end