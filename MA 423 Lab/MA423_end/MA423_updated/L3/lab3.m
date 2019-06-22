%%% 1 %%%

%%% a)
t = 1:.5:3;
A = zeros(5,2);
A(:,1)=ones(5,1);
A(:,2)=t';
b = 1.1:.1:1.5;
b = [1.1 1.2 1.3 1.3 1.4];
b=b';
s = ones(5,1);
A = [s t'];

%%% b)
x = A\b;

%%% c)
fig=figure();
plot(t,x(1)+x(2)*t);
hold on;
plot(t,b,'r*');
close(fig);

%%% d)
r = b - x(1)*s - x(2)*t';
disp(sqrt(sum(r.*r)));
disp(norm(r));

%%% 2 %%%
t = -5:0.5:6;
A = fliplr(vander(t));
A = A(:,1:20);

syms z;
%f = @(z) (sin((pi*z)/5)+z/5);
% Don't use f before
f(z) = sin(pi*z/5)+z/5;

b = eval(f(t));
b = b';

%%% a)
p1 = A\b;
disp(p1);

%%% b)
p2 = (A'*A)\(A'*b);
disp(p2);

%%% c)
T = eye(43);
T(1:23,24:43)=A;
T(24:43,1:23)=A';
T(24:43,24:43)=zeros(20);
b1 = [b ;zeros(20,1)];
%C = [ eye(23) A; A' zeros(20)];
%B = [b ;zeros(20,1)];
x1 = T\b1;
p3 = x1(24:43);
%x2 = C\B;

disp(cond(A));
disp(cond(A'*A));
disp(cond(T));

disp(norm(A*p1-b));
disp(norm(A*p2-b));
disp(norm(A*p3-b));
disp(norm(x1(1:23)));

% flip in case of polyval
% p1 = flip(p1);
% p2 = flip(p2);
% p3 = flip(p3);

fig=figure();
plot(t,A*p1);
hold on;
plot(t,A*p2);
plot(t,A*p3);
plot(t,b);
hold off;
legend('p1','p2','p3','f');
close(fig);

%%% 3 %%%
X = linspace(0,1,50)';
A = ones(50,7);
for i=2:7
    A(:,i)=A(:,i-1).*X;
end
w = rand(7,1);
b = A*w;
xhat = (A'*A)\(A'*b);
xtilde = A\b;
disp('-----Q3-----');
disp(norm(xhat-w)/norm(w));
disp(norm(xtilde-w)/norm(w));
disp(norm(A*xhat-b)/norm(b));
disp(norm(A*xtilde-b)/norm(b));
disp(cond(A));

Ne = []; % Normal method error of soln
QRe = []; % QR error

RNe = zeros(length(6:15)); % Normal method Rel error
RQRe = zeros(10,1);

for n=6:15
    A = ones(50,n);
    for i=2:n
        A(:,i)=A(:,i-1).*X;
    end
    w = rand(n,1);
    b = A*w;
    xhat = (A'*A)\(A'*b);
    xtilde = A\b;
%     disp('-----Q3-----');
%     disp(norm(xhat-w)/norm(w));
%     disp(norm(xtilde-w)/norm(w));
%     disp(norm(A*xhat-b)/norm(b));
%     disp(norm(A*xtilde-b)/norm(b));
%     disp(cond(A));
    Ne(end+1) = norm(xhat-w)/norm(w);
    QRe(end+1) = norm(xtilde-w)/norm(w);
    RNe(n-5) = norm(A*xhat-b)/norm(b);
    RQRe(n-5) = norm(A*xtilde-b)/norm(b);
    % Be careful while using var in loop
    % Be caerful with initializations
end

fig = figure();
semilogy(6:15,Ne);
hold on;
semilogy(6:15,QRe);
hold off;
legend('Normal error','QR error');
%close(fig);

fig = figure();
semilogy(6:15,RNe);
hold on;
semilogy(6:15,RQRe);
hold off;
legend('Normal rel error','QR rel error');
