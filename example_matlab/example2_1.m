%Example 2.1a
n = [-5:5];
x = 2*impseq(-2,-5,5) - impseq(4,-5,5);
subplot(2,2,1); stem(n,x); title('Sequence in Problem 2.1a')
xlabel('n'); ylabel('x(n)');

%Example 2.1b
n = [0:20];
x = n.*(stepseq(0,0,20)-stepseq(10,0,20)) + 10.*exp(-0.3*(n-10)).*(stepseq(10,0,20)-stepseq(20,0,20));
subplot(2,2,2); stem(n,x); title('Sequence in Problem 2.1b')
xlabel('n'); ylabel('x(n)');

%Example 2.1c
n = [0:50]; 
x = cos(0.04*pi*n)+0.2*randn(size(n));
subplot(2,2,3); stem(n,x); title('Sequence in Problem 2.1c')
xlabel('n');
ylabel('x(n)');

%Example 2.1d
n = [-10:9]; x = [5,4,3,2,1];
xtilde = x' * ones(1,4);
xtilde = (xtilde(:))';
subplot(2,2,4); stem(n,xtilde);
title('Sequence in Problem 2.1d')
xlabel('n'); ylabel('xtilde(n)');