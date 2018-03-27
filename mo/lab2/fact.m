function x=fact(k)
  f = 1;
  for i=1:1:k-1
      ff=oddprod(3, 2^(i+1) - 1);
      f=f*ff;
  end
  x=2^ (2 ^ k - 1) * f;
end