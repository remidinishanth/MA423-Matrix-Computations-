function [ W ] = myWilkinson(n)
    W = zeros(n,n);
    W = eye(n);
    W = W-tril(ones(n,n),-1);
    W(:,n)=ones(1,n);
end

