%%% 1 %%%
x = 2;
while x>1
    x = x/2;
end
disp(x);

% clc;
% clear;

x = 2;
while x+1>1
    x = x/2;
end
disp(x==eps/2);

%%% 2 %%%

x = linspace(1.95,2.05,151);

%syms z;
%f(z)=expand((z-2)^9);
% then use f(1.9);

p = [1, -18, 144, -672, 2016, -4032, 5376, -4608, 2304, -512];

a1 = polyval(p,x);
a2 = (x-2).^9;
f = figure();
plot(x,a1);
hold on;
plot(x,a2);
legend('polyval','(x-2)^9');
hold off;
close(f);

% Round off error, exact reason ask prof

for n=4:6
    A = magic(n);
    [V,D] = eig(A);
    disp(max(eig(A)));
    disp(max(diag(D)));
    [U,T]=schur(A);
    disp(T);
    %disp(A*U);
    %disp(U*T);
end

%%% 4 %%%

% eigshow
% eigshow()
% elliptical path

%%% 5 %%%

%imagesvd
%imagesvd('satya.jpg');
% Initially visual quality increases with rank
% But after certain rank, we cannot see much change in quality

%%% 6 %%%
A = gallery(5);
B = A^5;
disp(eig(B));
e = eig(A);
disp(e);
plot(real(e),imag(e),'r*',0,0,'ko');
axis(.1*[-1 1 -1 1]);
axis square;
hold on;

% e = eig(A+eps*rand(5,5).*A);plot(real(e),imag(e),'b*',0,0,'ko');

e = eig(A+eps*rand(5,5).*A);