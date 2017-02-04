function [ najlepszy ] = wybor_najlepszego( plecaki,index )
[  temp najlepszy ]=max(sum(plecaki(:,:,index)'));
end