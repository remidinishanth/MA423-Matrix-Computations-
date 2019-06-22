function [L, U] = GENP(A)
    [~, n] = size(A);
    for k = 1:n-1
        A(k+1:n,k) = A(k+1:n,k)/A(k,k);
        j = k+1:n;
        A(j,j) = A(j,j)-A(j,k)*A(k,j);
    end
    L = eye(n,n)+ tril(A,-1);
    fprintf('Max Max of L');
    disp(max(max(abs(L))));
    U = triu(A);
end

