%%% 1
a=1;
b= (-1)*(10^7+10^(-7));
c=1;
[x1,x2]=quadroot1(a,b,c);
disp([x1,x2]);
[x1,x2]=quadroot2(a,b,c);
disp([x1,x2]);

%format long e gives the error

%%% 2
f = sqrt(eps);
A = [1 f;f 1];

T=A;
for i=1:10
    [Q,R]=qr(T);
    T=R*Q;
end

disp(diag(T));
disp(eig(A));

a = 1;
b = -2;
c = 1-f^2;
[x1,x2]=quadroot1(a,b,c);
disp([x1,x2]);
[x1,x2]=quadroot2(a,b,c);
disp([x1,x2]);

%%% 3
A=gallery(5);
e=eig(A);
fig=figure();
plot(real(e),imag(e),'r*',0,0,'ko');
axis(.1*[-1 1 -1 1]);
axis square;
hold on;
e = eig(A + eps*randn(5,5).*A); plot(real(e),imag(e),'b.');
close(fig);

%%% 4

W = diag(20:-1:1)+diag(20*ones(19,1),1);
%[V,D]=eig(W);
[V,D,s]=condeig(W);
eigw = eig(W);
eigw1 = eigw;

e=7.8*10^(-10);
for e=[7.8*10^(-10),7.5*10^(-12),7.8*10^(-14)]
    W1 = W;
    W1(20,1)=e;
    eigw1 = eig(W1);
    [V1,D1]=eig(W1);
    [eigw,id]=sort(eigw);
    disp('Compare');
    disp([abs(eigw-sort(eigw1)),s(id)*e]);
end

% In case 3 they are not within bound

disp(cond(V));

% When e is less than 1/cond(V) they are not within bounds
disp([eigw,eigw1]);
disp(s);

% They have highest condition value

fig=figure();
plot(real(eig(W)),imag(eig(W)),'r*');
hold on;
for i=1:500
    Ei = 10^(-14)*(-1+2*randn(20));
    %disp(norm(Ei));
    Wi = W+Ei;
    %eigwi = eig(Wi);
    plot(real(eig(Wi)),imag(eig(Wi)),'bx');
end

% Doubt they are almost close
% They are highly varied in between 8 & 12

for e=[7.8*10^(-10),7.5*10^(-12),7.8*10^(-14)]
    W1 = W;
    W1(20,1)=e;
    J=jordan(W);
    J1=jordan(W1);
end

W1=W;
W1(20,1)=10^(-15);
disp(eig(W1));
% Here we observe that eigen values are real 
% and simple