%%% 1
R = triu(randn(50));
[Q,X] = qr(randn(50));
A = Q*R;
[S,T]=qr(A);

disp([norm( Q-S ), norm( R-T )]);

E = S*T-A;
disp(norm(A-S*T));

%%% 2
A = randn(7, 4);
disp(size(A));
disp(rank(A));
A(:, 5:6) = A(:, 2:3) + A(:, 3:4);
%A(:,[5 6]) = A(:,[2:3])+A(:,[3,4]);
disp(size(A));
disp(rank(A));

%%% 3
A = gallery('kahan',90,1.2,0);
sig = svd(A);
%disp(sig);
disp(rank(A));

A = gallery('kahan',90,1.2,25);
sig = svd(A);
%disp(sig);
disp(rank(A));

[Q, R, E] = qr(A);
dif = norm(eye(90) - E);
disp(dif);

disp(R(90,90));
