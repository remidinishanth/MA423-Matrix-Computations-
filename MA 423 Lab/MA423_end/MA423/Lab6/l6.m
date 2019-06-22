C=[];
N= 2:2:16;
for n=N
    H=hilb(n); 
    C=[C; cond(H)];
end
f=figure();
semilogy(N,C);
close(f);

%%% Check eig(hilb(12)) to convince
%%% hilb matrix is PSD

%%% Backslash is Cholesky factorization
%%% Very stable algo

n=8;
H=hilb(n);
HI=invhilb(n);
x=rand(n,1);
b=H*x;
x1=H\b;
x2=HI*b;
eta1=norm(H*x1-b)/(norm(H)*norm(x));
eta2=norm(H*x2-b)/(norm(H)*norm(x));
condn=cond(H);
err1=norm(x1-x);
err2=norm(x2-x);
disp([eta1 eta2 condn err1 err2]);

for n=10:12
    H=hilb(n);
    HI=invhilb(n);
    x=rand(n,1);
    b=H*x;
    x1=H\b;
    x2=HI*b;
    eta1=norm(H*x1-b)/(norm(H)*norm(x));
    eta2=norm(H*x2-b)/(norm(H)*norm(x));
    condn=cond(H);
    err1=norm(x1-x);
    err2=norm(x2-x);
    disp([eta1 eta2 condn err1 err2]);
end


%c)

n=10;
H=hilb(n); 
x=randn(n,1);
b = H*x;
x1= H \ b;
r = H*x1-b;
fprintf('[norm(x) norm(x-x1)] = ')
disp( [norm(r) norm(x-x1)])


%d)
for n=16
    H = hilb(n);
    [L, U]=GENP(H);
    x=rand(n,1);
    b=H*x;
    x1=L\b; %Matlab recognizes Lower triangular
    x1=U\x1; %Matlab recognizes Upper traingular
    HI = invhilb(n);
    x2=H\b;
    eta1=norm(H*x1-b)/(norm(H)*norm(x));
    eta2=norm(H*x2-b)/(norm(H)*norm(x));
    err1=norm(x1-x);
    err2=norm(x2-x);
    disp([eta1 eta2 err1 err2]);
    nr=norm(H-L*U);
    disp(nr);
end
fprintf('\n\n');

% A = [10^(-16) 1;1 1]


%2a

n=32;
W = myWilkinson(n);
x = rand(n,1);
b=W*x;
x1=W\b;
disp(norm(x1-x,Inf)/norm(x,Inf));
disp(cond(W));
fprintf('\n');

n=64;
W = myWilkinson(n);
x = rand(n,1);
b=W*x;
x1=W\b;
disp(norm(x1-x,Inf)/norm(x,Inf));
disp(cond(W));
fprintf('\n\n');

%2b
n=32;
W = myWilkinson(n);
x = rand(n,1);
b=W*x;
[Q,R] =qr(W);
x1=Q'*b;
x1=R\x1;
disp(norm(x1-x,Inf)/norm(x,Inf));
fprintf('\n');

n=64;
W = myWilkinson(n);
x = rand(n,1);
b=W*x;
[Q,R] =qr(W);
x1=Q'*b;
x1=R\x1;
disp(norm(x1-x,Inf)/norm(x,Inf));
fprintf('\n\n');