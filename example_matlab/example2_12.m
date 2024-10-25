b = [1]; a = [1,-0.9];
n = -5:50; x = stepseq(0,-5,50) - stepseq(10,-5,50);
y = filter(b,a,x);
stem(n,y); title('Output sequence')
xlabel('n'); ylabel('y(n)'); axis([-5,50,-0.5,8])