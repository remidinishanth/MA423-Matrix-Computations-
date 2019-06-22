function [U, S, V] = mysvd1(A)
% [U, S, V] = mysvd1(A) produces a diagonal matrix S of singular
% values of nonsingular matrix A and two unitary matrices U and V
% whose columns are the corresponding left and right singular
% vectors so that A * V = U * S
    [V,D]=eig(A'*A);
    [~,P]=sort(diag(D),'descend'); % Permutation Matrix
    S=sqrt(D);
    S = S(P,P);
    V = V(:,P);
    U = A*V*S^(-1);
end

