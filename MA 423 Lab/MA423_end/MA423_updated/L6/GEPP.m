function [ L,U,p,rho] = GEPP( A )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
% PA=LU
    Ac = A;
    [n,~]=size(A);
    p=(1:n)';
    for k=1:n-1
        [~,m]=max(abs(A(k:n,k)));
        m=m+k-1;
        if(m~=k)
            A([k,m],:)=A([m,k],:);
            p([k,m])=p([m,k]);
        end
        if A(k,k)~=0
            A(k+1:n,k)=A(k+1:n,k)/A(k,k);
            j=k+1:n;
            A(j,j)=A(j,j)-A(j,k)*A(k,j);
        end
    end
    L=eye(n,n)+tril(A,-1);
    U=triu(A);
    rho = max(max(abs(U)))/max(max(abs(Ac)));
end

% A = A(p,:)
% then A = LU

