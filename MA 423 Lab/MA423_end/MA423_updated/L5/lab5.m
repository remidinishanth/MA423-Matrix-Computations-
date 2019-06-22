%%% 1
R = triu(randn(50));
[Q,X]=qr(randn(50));
A = Q*R;
[S,T]=qr(A);

%%% Not forward Stable
disp([norm(Q-S),norm(R-T)]);

%%% Backward Stable
disp(norm(A-S*T));

%%% 2
A = randn(7,4);
disp(rank(A));
%disp(A);
A(:,5:6)=A(:,2:3)+A(:,3:4);
%disp(A);
disp(rank(A));

%%% 3
theta = 1.2;
disp(sin(theta)^89); % Smallest main diag entry
% help private/kahan
A = gallery('kahan',90, 1.2, 0);
sig = svd(A);
disp([sig(1),sig(89),sig(90)]);
disp(rank(A));

A = gallery('kahan',90,1.2,25);
sig = svd(A);
disp([sig(1),sig(89),sig(90)]);
disp(rank(A));

[Q,R,E]=qr(A);
dif = norm(E-eye(90));
disp(dif);
disp(R(90,90));

%%% 4
a1 = [0 0 0 1 1 0 1 0 0 0]';
a2 = [0 0 0 0 0 1 0 1 0 1]';
a3 = [0 0 0 1 0 0 1 1 1 1]';
a4 = [1 0 0 0 0 0 1 0 1 0]';
a5 = [0 1 1 0 0 0 0 0 1 1]';
A = [a1 a2 a3 a4 a5];
v = [0 0 0 0 0 0 0 1 1 1]';
disp(A.*v);
ang = A.*v;
tang = sum(ang)./sqrt(sum(A)); % A only contains 1's and 0's
disp(tang/norm(v));
% help pdist

[U S V]=svd(A);
disp(['Frob norm = ',num2str(norm(A,'fro'))]);

for k=1:5
    Ak = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
    disp([k,norm(A-Ak,'fro')/norm(A,'fro')]);
end
k=2;
Ak = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
Uk = U(:,1:k);
Dk = S(1:k,1:k)*V(:,1:k)';
vk = Uk'*v;
for j=1:5
    disp(vk'*Dk(:,j)/(norm(vk)*norm(Dk(:,j))) );
end
