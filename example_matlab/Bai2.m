h=[ 4,1,1,2,5,6,5,2,1,1,4];
M = length(h); n = 0:M-1;
[Hr,w,b,L]=Hr_Type2(h);
b,L 
bmax = max(b) + 1; bmin = min(b)-1;
subplot(2,1,1); stem(n,h); axis([01 2*L bmin bmax ])
xlabel('n'); ylabel('h(n)');title('Impulse Response')
%subplot(2,1,2); stem(0:L, b); axis([01 2*L bmin bmax ])
%xlabel('n'); ylabel('b(n)');title('b(n) coefficients')
subplot(2,1,2); plot(w/pi, Hr); grid
xlabel('freq in pi unit'); ylabel('Hr')
title('Ket qua bai 2 cua nhom Anh Tuan va Van Quang')
%subplot(2,2,4); zplane(h,1)
