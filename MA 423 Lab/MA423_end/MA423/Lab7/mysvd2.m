function [ U,Sig,V ] = mysvd2( A )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
     [V,D]=eig(A'*A);
     [~,P]=sort(diag(D),'descend'); % Permutation Matrix
     r = rank(A);
     V = V(:,P);
     D=D(P,P);
     S=sqrt(D);
     V1 = V(:,1:r);
     Sr=S(1:r,1:r);
     [Z,SS]=eig(A*A');
     [~,P]=sort(diag(SS),'descend');
     SS=SS(:,P);
     Z=Z(:,P);
     m=size(A,1);
     n=size(A,2);
     Zmr= Z(:,r+1:m);
     U2=Zmr;
     U1=A*V1*Sr^(-1);
     U=[U1,U2];
     Sig=zeros(m,n);
     Sig(1:r,1:r)=Sr;
end

