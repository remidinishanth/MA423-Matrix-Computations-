function [ Q,R ] = MyMGS( A )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    
    [m,n]=size(A);
    Q = zeros(m,n);
    R = zeros(n,n);
    for i=1:n
        Q(:,i)=A(:,i);
        for j=1:i-1
            %R(j,i)=dot(Q(:,i),Q(:,j));
            R(j,i)=Q(:,j)'*Q(:,i);
            Q(:,i)=Q(:,i)-R(j,i)*Q(:,j);
        end
        R(i,i)=norm(Q(:,i));
        if R(i,i)==0
            disp('Error');
            return;
        end
        Q(:,i)=Q(:,i)/R(i,i);
    end

end

