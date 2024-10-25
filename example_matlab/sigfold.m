function [y,n] = sigfold(x,n)
y = fliplr(x);
n = - fliplr(n);
stem(n, y)
xlabel('n')
ylabel('y')
title('sigsfold')
