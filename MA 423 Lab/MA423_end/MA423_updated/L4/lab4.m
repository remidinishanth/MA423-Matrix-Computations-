[U,~]=qr(randn(80));
[V,X]=qr(randn(80));
S = diag(2.^(-1:-1:-80));
A = U*S*V;

[QC,RC]=MyCGS(A);
[QM,RM]=MyMGS(A);
[Q,R]=qr(A);

disp(norm(QC'*QC-eye(80)));
disp(norm(QM'*QM-eye(80)));
disp(norm(Q'*Q-eye(80)));

fig=figure();
x=(1:80)';
hold off;
semilogy(x,abs(diag(RC)),'bo');
hold on;
semilogy(x,abs(diag(RM)),'rx');
semilogy(x,abs(diag(R)),'k+');
title('abs(diag(R)) for cgs, mgs and qr');
%gtext('cgs=o, mgs = x, qr=+');
hold off;
close(fig);

[QQC,RRC]=MyCGS(QC);
RR = RRC*RC;
disp(norm(QQC'*QQC-eye(80)));

fig=figure();
x=(1:80)';
hold off;
semilogy(x,abs(diag(RR)),'bo');
hold on;
semilogy(x,abs(diag(RM)),'rx');
semilogy(x,abs(diag(R)),'k+');
title('abs(diag(R)) for cgs, mgs and qr');
%gtext('cgs=o, mgs = x, qr=+');
%hold off;
close(fig);

%%% 2 %%%

%a

for n=[7 12]
    H = hilb(n);
    [Q,R]=MyCGS(H);
    disp(n);
    disp(norm(Q'*Q-eye(n)));
    disp(norm(H-Q*R));
    [Q,R]=MyMGS(H);
    disp(norm(Q'*Q-eye(n)));
    disp(norm(H-Q*R));
    [Q,RR]=MyMGS(Q);
    R=RR*R;
    disp(norm(Q'*Q-eye(n)));
    disp(norm(H-Q*R));
    % Here H is square
    % Why to do economy size QR
    [Q,R]=qr(H,0);
    disp(norm(Q'*Q-eye(n)));
    disp(norm(H-Q*R));
end

% Significance of Residual Norm ?

%%% 3 %%%
A = importdata('Filip.dat');
A = importdata('filip.dat');
A = readtable('filip.dat');
fig = figure();
plot(A.Var1,A.Var2,'.');
close(fig);

%%% 4 %%%

x = [1.02 0.95 0.87 0.77 0.67 0.56 0.44 0.3 0.16 0.01]';
y = [0.39 0.32 0.27 0.22 0.18 0.15 0.13 0.12 0.13 0.15]';

A = [x.*x x.*y y.*y x y];
c = -A\ones(length(x),1);
disp(c);

%fig=figure();
[X,Y]=meshgrid(x,y);
Z=c(1)*X.^2+c(2)*X.*Y+c(3)*Y.^2+c(4)*X+c(5)*Y+1;
contour(X,Y,Z,'ShowText','on');
hold on;
plot(x,y,'r*');
%close(fig);

c=0.005;
dx = -c+2*c*rand(10,1);
dy = -c+2*c*rand(10,1);
x = x+dx;
y = y+dy;

A = [x.*x x.*y y.*y x y];
c = -A\ones(length(x),1);
disp(c);

%fig=figure();
[X,Y]=meshgrid(x,y);
Z=c(1)*X.^2+c(2)*X.*Y+c(3)*Y.^2+c(4)*X+c(5)*Y+1;
contour(X,Y,Z,'ShowText','on');
hold on;
plot(x-dx,y-dy,'r*');
%close(fig);