a=1;
b=-(10^7+10^(-7));
c=1;

[x1,x2]=quadroot1(a,b,c);
A=[x1 x2];
disp(A);

[x1,x2]=quadroot2(a,b,c);
B=[x1 x2];
disp(B);

f=sqrt(eps);
A = [1 f;f 1];
for i=1:10
    [Q,R]=qr(A);
    A=R*Q;
end
eig(A)
l1=1+f
l2=1-f

a=1;
b=-2;
c=1+eps;

[x1,x2]=quadroot1(a,b,c);
A=[x1 x2];
disp(A);


[x1,x2]=quadroot2(a,b,c);
B=[x1 x2];
disp(B);


A = gallery(5);
e = eig(A);
plot(real(e),imag(e),'r*',0,0,'ko');
axis(.1*[-1 1 -1 1]);
axis square;