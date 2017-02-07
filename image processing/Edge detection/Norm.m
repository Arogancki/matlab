function [ x ] = Norm( x )

x=double(x);
x=uint8((x/max(max(x))).*255);

end

