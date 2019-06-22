function [ L,U ] = GENP( A )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    [n,~]=size(A);
    for k=1:n-1
        A(k+1:n,k)=A(k+1:n,k)/A(k,k);
        j=k+1:n;
        A(j,j)=A(j,j)-A(j,k)*A(k,j);
    end
    L = eye(n,n)+tril(A,-1);
    U = triu(A);
end

