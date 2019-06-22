t = -5:0.5:6;
A=fliplr(vander(t));
A = A(:,1:20);

%%% a) %%
syms x;
f = @(x) sin(pi*x/5)+x/5;
b = f(t)';
x = A\b;
plot(t,A*x,'.-');
hold on;
disp('a)');
disp(norm(A*x-b));

%%% b) %%
x = (A'*A)\(A'*b);
plot(t,A*x,'.-');
disp('b)');
disp(norm(A*x-b));

%%% c) %%
C = [ eye(23) A; A' zeros(20)];
B = [b ;zeros(20,1)];
x = C\B;
disp(size(x));
x=x(24:43);
plot(t,A*x,'.-');
disp('c)');
disp(norm(A*x-b));

format long;
disp(cond(A));
format;
disp(cond(A));