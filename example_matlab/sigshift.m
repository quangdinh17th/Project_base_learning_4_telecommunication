function [y,n] = sigshift(x,m,n0)
n = m +n0;
y =x;
stem(n, y)
xlabel('n')
ylabel('y')
title('sigshift')