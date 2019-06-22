for n=4:6
    A=magic(n);
    disp(n);
    [U,S,V]=mysvd1(A);
    disp('mysvd1');
    disp(norm(V'*V-eye(n)));
    disp(norm(U'*U-eye(n)));
    disp(norm(A*V-U*S));
    Verr(n-3,1)=norm(V'*V-eye(n));
    Uerr(n-3,1)=norm(U'*U-eye(n));
    Aerr(n-3,1)=norm(A*V-U*S);
    
    [U,S,V]=mysvd2(A);
    disp('mysvd2');
    disp(norm(V'*V-eye(n)));
    disp(norm(U'*U-eye(n)));
    disp(norm(A*V-U*S));
    Verr(n-3,2)=norm(V'*V-eye(n));
    Uerr(n-3,2)=norm(U'*U-eye(n));
    Aerr(n-3,2)=norm(A*V-U*S);

    [U,S,V]=svd(A);
    disp('svd');
    disp(norm(V'*V-eye(n)));
    disp(norm(U'*U-eye(n)));
    disp(norm(A*V-U*S));
    Verr(n-3,3)=norm(V'*V-eye(n));
    Uerr(n-3,3)=norm(U'*U-eye(n));
    Aerr(n-3,3)=norm(A*V-U*S);

end

fig=figure();
semilogy(4:6,Verr(:,1));
hold on;
semilogy(4:6,Verr(:,2));
semilogy(4:6,Verr(:,3));
title('Verr');
legend('mysvd1','mysvd2','svd');

fig=figure();
semilogy(4:6,Uerr(:,1));
hold on;
semilogy(4:6,Uerr(:,2));
semilogy(4:6,Uerr(:,3));
title('Uerr');
legend('mysvd1','mysvd2','svd');

fig=figure();
semilogy(4:6,Aerr(:,1));
hold on;
semilogy(4:6,Aerr(:,2));
semilogy(4:6,Aerr(:,3));
title('Aerr');
legend('mysvd1','mysvd2','svd');

% Aerror interpretation