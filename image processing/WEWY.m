function [ WE,WY ] = WEWY( IMG2, GORA, PRAWO )

WE=IMG2(1:end-abs(GORA),1:end-abs(PRAWO));

WY=IMG2(1+abs(GORA):end,1+abs(PRAWO):end);

if (GORA<0 || PRAWO <0)
   temp=WE;
   WE=WY;
   WY=temp;
end

end

