x = [1 2 3 4 5 6 7 6 5 4 3 2 1];
n = [-2:10];
[x11,n11] = sigshift(x,n,5);
[x12,n12] = sigshift(x,n,-4);
[x1,n1] = sigadd(2*x11,n11,-3*x12,n12);
subplot(2,1,1); stem(n1,x1); title('Sequence in Example 2.2a');
xlabel('n'); ylabel('x1(n)');