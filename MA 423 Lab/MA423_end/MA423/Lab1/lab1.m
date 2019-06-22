%%%%% Question 1 %%%%%

x = (4/3 -1)*3 -1;
disp(x);

x = 5*((1+exp(-50))-1)/((1+exp(-50))-1);
disp(x);

x = log(exp(750))/100;
disp(x);

%%%%% Question 1 %%%%%%

A = rand(8);
disp(A);

disp(max(A));

disp(max(A'));
%%%sum(A,2) is a col vector containing the sum of each row
disp(sum(A,2)); 


disp(max(max(A)));

disp(A > 0.25);

%%%% Question 2 %%%%%

A = magic(4);

disp(A);
disp(sum(A));
disp(sum(A'));

disp(diag(A));
disp(sum(diag(A)));
disp(trace(A));

disp(flip(A));
disp(trace(flip(A)));


%%%% Question 3 %%%%%

for n=3:5
    A = magic(n);
    disp(A);
    p = randperm(n); 
    q = randperm(n);
    disp(p);
    disp(q);
    A = A(p,q);
    disp(A);
    disp(sum(A));
    disp(sum(A'));

    disp(diag(A));
    disp(sum(diag(A)));
    disp(trace(A));

    disp(flip(A));
    disp(trace(flip(A)));
end

disp('Magic 4 Analysis');
A = magic(4);
disp(A);
disp(null(A));
disp(null(A,'r'));
disp(null(sym(A)));
disp(rref(A)); %% Row Reduced Echelon form

disp(sym(1./A));

%%%%% Question 4 %%%%%
A = magic(5);
disp(A^(-1) == eye(5)/A);
disp(inv(A) == eye(5)/A);
disp(A^(-1) == inv(A));

disp(A.^(-1) == 1./A);

%%%%% Question 5 %%%%%

%%% Differentiation

%%%%% Question 6 %%%%%

a = 1:1:16;
A = diag(a);
rr = zeros(1,16);
rr(1)=-2;rr(2)=1;rr(16)=1;
cc = rr;
disp(toeplitz(cc,rr));
%%(b)
rr = 1:1:8;
A = toeplitz(rr,rr);
disp(toeplitz([1 2 3 4 5 6 7 8]));
disp(triu(A));
%%(c)
A = 1./A;
disp(sym(A));

%%%%% Question 7 %%%%%

A = rand(5);
disp(A);
disp(sum(A./sum(A)));

A = rand(5);
A(:,4)=0;
disp(A);
A = A./sum(A);
A(isnan(A./sum(A)))=0;
disp(A);

A = rand(5);
A(:,4)=0;
A(:,find(sum(A)>0)) = A(:,find(sum(A)>0))./sum(A(:,find(sum(A)>0)));
A(:,sum(A)>0) = A(:,sum(A)>0)./sum(A(:,sum(A)>0));

%clear;
rand('state', 1000);
x = [1, 2];
for n=2:999, x(n+1) = x(n)+sign( rand-0.5)*x(n-1); end
semilogy (1:1000, abs(x));
c =1.13198824;
hold on;
semilogy(1:1000, c.^ [1:1000]);
hold off