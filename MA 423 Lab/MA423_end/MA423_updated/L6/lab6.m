%%% 1)
%a)
C = [];
N = 2:2:16;
for n=N
    H = hilb(n);
    C = [C;cond(H)];
end
fig=figure();
semilogy(N,C);
close(fig);

%b)
n=8;
H=hilb(n);
HI=invhilb(n);
x=rand(n,1);
b=H*x;

x1=H\b;
x2=HI*b;

format long e;
for n=[8 10 12 14]
    H=hilb(n);
    HI=invhilb(n);
    x=rand(n,1);
    b=H*x;
    A=H;
    x1=A\b;
    x2=HI*b;
    %disp([x x1 x2]);
    %disp([x-x1 x-x2]);
    eta1 = norm(A*x1-b)/(norm(b)*norm(A));
    eta2 = norm(A*x2-b)/(norm(b)*norm(A));
    condn = cond(H);
    err1 = norm(x-x1)/norm(x);
    err2 = norm(x-x2)/norm(x);
    disp([eta1 eta2 condn err1 err2]);
    % eta1 is order of u
    % So method1 is backward stable
    
    % When condn>12 m1 is better than m2
    
    % method1 is better in case 
    % of ill-cond matrix
end
%format;

%c)
n=10;
H=hilb(n);
x=randn(n,1);
b=H*x;
x1 = H\b;
r = H*x1-b;
disp([norm(r) norm(x-x1)]);
% residual is zero but x is not close to x1
% from the above formula, cond comes into play

%d)

for n=[8 10 12]
    H=hilb(n);
    [L,U]=GENP(H);
    x=randn(n,1);
    b = H*x;
    y = L\b; % y=Ux;
    A = H;
    x3 = U\y;
    eta3 = norm(A*x3-b)/(norm(A)*norm(b));
    disp(eta3);
end

% H is PD
% It turns out to be Backward stable

format;
%%% 2)

% a)
n = 32;
A = Wilk(n);
x = randn(n,1);
b = A*x;
x4 = A\b;
disp('Wilkinson matrix error');
disp(norm(x-x4,Inf)/norm(x,Inf));
disp(cond(A));

n = 64;
A = Wilk(n);
x = randn(n,1);
b = A*x;
x4 = A\b;
disp('Wilkinson matrix error');
disp(norm(x-x4,Inf)/norm(x,Inf));
disp(cond(A));

%b)
for n=[32 64]
    A = Wilk(n);
    [Q,R]=qr(A);
    x = randn(n,1);
    b = A*x;
    y = Q'*b;
    x5 = R\y;
    disp(norm(x-x5,Inf)/norm(x,Inf));
end

%%% 3)

%a)
fig=figure();
n=10:.5:505;
X = 2.^(n-1);
semilogy(n,X,'r');
hold on;
n=10:20:500;
m=length(n);
G=zeros(m,1);
for i=1:m
    W = Wilk(n(i));
    [L,U,p,rho]=GEPP(W);
    G(i)=rho;
end
semilogy(n,G,'b*');
close(fig);

%%% 4)

pga = zeros(20,1);
conda = zeros(20,1);
for n=1:20
    s = 10;
    L = tril(round(s*randn(n)),-1)+eye(n);
    U = triu(round(s*randn(n)),-1)+eye(n);
    A = L*U;
    [L,U]=GENP(A);
    pga(n) = max(max(U))/max(max(A));
    conda(n) = cond(A);
    %disp([pga,conda]);
end

plot(1:20,pga);
hold on;
plot(1:20,conda);
legend('PG','cond');
% There doesn't exist any cor
%plot(pga,conda);