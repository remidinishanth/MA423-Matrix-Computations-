%%%% Question 1 %%%%
x = 2;
while x > 1
    x = x/2;
end
disp(x);

x = 2;
while 1+x > 1
    x = x/2;
end
disp(x);

% %%%% Question 2 %%%%
% 
% p = [1 -18 144 -672 2016 -4032 5376 -4608 2304 -512];
% x = linspace(1.95,2.05,151);
% y = polyval(p,x);
% f=figure(1);
% plot(x,y,'.-');
% saveas(f,'2a.png','png');
% close(f);
% 
% f=figure(2);
% syms xx;
% p = (xx-2)^9;
% plot(x,subs(p,x),'m');
% saveas(f,'2b.png','png');
% close(f);
% 
% f=figure(3);
% p(xx) = (xx-2)^9;
% plot(x,p(x),'b');
% hold on;
% plot(x,y,'r.-');
% title('Plot of p(x)=(x-2)^9');
% legend('Expeval','polyval');
% saveas(f,'2ab.png');
% close(f);

%%%% Question 3 %%%%

for n=4:6
    A = magic(n);
    disp(A);
    eig_val = eig(A);
    fprintf('Largest eigen value = %f\n\n',max(eig_val));
end

[A B] = schur(magic(5));
disp([A B]);

%%%% Question 4 %%%%

% eigshow(magic(2));
% eigshow([0 0;0 1]);
% A = [.67 .72; -1.21 1];
% eigshow(A); %%% Imaginary Eigen values

%%%% Question 5 %%%%%

%imagesvd('satya.jpg');

%%%% Question 6 %%%%%

% f=figure(4);
% A = gallery(5);
% disp(A);
% B = A^5;
% disp(eig(B));
% disp(B);
% e = eig(A);
% plot(real(e),imag(e),'r*',0,0,'ko');
% axis(.1*[-1 1 -1 1])
% axis square

f=figure(5);
A = gallery(5);
disp(A);
B = A^5;
disp(B);
e = eig(A + eps*randn(5,5).*A);
plot(real(e),imag(e),'r*',0,0,'ko');
axis(.1*[-1 1 -1 1]);
axis square;

f=figure(6);
A = gallery(5);
A = A + eps*randn(5,5).*A;
disp(A);
B = A^5;
disp(B);
e = eig(A);
plot(real(e),imag(e),'r*',0,0,'ko');
hold on;
e = eig(B);
plot(real(e),imag(e),'b*',0,0,'ko');
axis(.1*[-1 1 -1 1]);
axis square;
