function [ U,S,V ] = mysvd2( A )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    [m,n]=size(A);
    [V,T]=schur(A'*A);
    [st,idx]=sort(diag(T),'descend');
    r=rank(A);
    S=sqrt(diag(st(1:r)));
    V=V(:,idx);
    V1=V(:,1:r);
    
    [Z,T]=schur(A*A');
    [st,idx]=sort(diag(T),'descend');
    Z=Z(:,idx);
    U2=Z(:,r+1:m);
    
    U1=A*V1*inv(S);
    U=[U1,U2];
    S=[S,zeros(r,n-r);zeros(m-r,n)];
end

