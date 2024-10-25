b= [1]; a= [1, -1, 0.9]; n= [-20:120];
x = stepseq(0,-20, 120); s= filter(b,a,x);
stem(n,s)
title('Step Response'); xlabel('n'); ylabel('s(n)')