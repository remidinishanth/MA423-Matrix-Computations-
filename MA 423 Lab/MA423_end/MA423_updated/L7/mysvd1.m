function [ U,S,V ] = mysvd1( A )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    [V,T]=schur(A'*A);
    [~,idx]=sort(diag(T),'descend');
    T=T(idx,idx);
    V=V(:,idx);
    S=sqrt(T);
    %U=A*V*diag(1./diag(T));
    U=A*V*inv(S);
end
