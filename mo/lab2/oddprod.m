function p=oddprod(l,h)
  p = 1;
  ml=l+1;
  if (mod(l,2)>0)
      ml=l;
  end
  mh=h-1;
  if (mod(h,2)>0)
      mh=h;
  end
  
  while ml <= mh
    p = p * ml;
    ml = ml + 2;
  end
end