%MA423 LAb 1

%%% 1 %%%

disp((4/3-1)*3-1);
% bcz of 4/3 -1

disp(5*((1+exp(-50))-1)/((1+exp(-50))-1));
% bcz of denominator

disp(log(exp(750))/100);
% exp(750) is Inf

%%% 1 %%%

A = rand(8);

disp(A);

% Max of each col
disp(max(A));

% Max of each row
disp(max(A'));
disp(max(A')');
disp(max(A,[],2));

% Max

disp(max(max(A)));

% Indices of elements greater than 0.25

B = A > 0.25;
disp(B);
disp(find(B));
[r,c]=find(B);

%%% 2 %%%

n=5;
A = magic(n);
disp(A);
disp(sum(A));
disp(min(sum(A))==max(sum(A)));
disp(min(sum(A,2))==max(sum(A,2)));
disp(sum(diag(A))==max(sum(A,2)));
disp(sum(diag(A))==sum(diag(flip(A))));

% Use trace

%%% 3 %%%

for n=3:5
    A = magic(n);
    p = randperm(n);
    q = randperm(n);
    A = A(p,q);
    disp(sum(A));
    disp(sum(A,2));
    disp(rank(A));
    % Diag and anti-diag sums doesn't
    % remain same
end

n = 4;
A = magic(n);
disp(null(A));
disp(null(A,'r'));
disp(null(sym(A)));
disp(rref(A));

%%% 4 %%%

A = magic(3);

disp(A^(-1));
disp(eye(3)/A);

disp(1./A);

disp(A^(-1) == eye(3)/A);
disp(inv(A) == eye(3)/A);
disp(A^(-1) == inv(A));

A = magic(4);

disp(A^(-1));

disp(eye(4)/A);

disp(1./A);

%%% 5 %%%

% Differentiation

%%% 6 %%%

A = -2*eye(16);
A = A + diag(ones(15,1),1);
A = A + diag(ones(15,1),-1);
A = A + diag(1,15) + diag(1,-15);
disp(A);

a = zeros(16,0);
a(1) = -2; a(2) = 1; a(16)=1;
A = toeplitz(a);
disp(A);

a = 1:1:8;
disp(a);
b = zeros(1,8);
b(1)=1;
disp(b);
A = toeplitz(b,a); % b as first column
disp(A);
A = toeplitz(a);
%%% one way of solution
A = 1./A;
disp(A);
%%% using triu
A = triu(A);
a = 1./a;
disp(a);
A = toeplitz(a);
disp(A);
disp(sym(A));
[N,D] = rat(A);
%%% Use format rat

%%% 7 %%%

A = magic(5);
A = A./sum(A);
A = magic(5);
A(:,6)= zeros(5,1);
a = (sum(A)~=0);
A(:,a)=A(:,a)./sum(A(:,a));

%%% 8 %%%

clear;
rand('state',1000);
x = [1 2];
for n=2:999
    x(n+1) = x(n)+sign(rand-0.5)*x(n-1);
end
semilogy(1:1000,abs(x));
c = 1.13198824;
hold on;
semilogy(1:1000,c.^[1:1000]);
hold off;