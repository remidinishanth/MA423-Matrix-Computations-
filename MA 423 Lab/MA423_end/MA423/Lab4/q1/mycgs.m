function [Q,R] = mycgs(A)
%%% Classical GS process %%%
    n = length(A(:,1));
    Q = A;
    R = A;
    for i=1:n
       Q(:,i)=A(:,i);
       for j=1:(i-1)
           R(j,i)=dot(Q(:,j),A(:,i));
       Q(:,i) = Q(:,i)-Q(:,j)*R(j,i);
       end
       R(i,i) = norm(Q(:,i));
       if(R(i,i)~=0)
           Q(:,i)=Q(:,i)/R(i,i);
       end
    end
end

