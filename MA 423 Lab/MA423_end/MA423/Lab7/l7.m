A = rand(4,4);

[ U S V ] = mysvd1(A);
[ U1 S1 V1]=svd(A);

disp(U*U');

disp(S);
disp(S1);

disp(U*S*V');
disp(A);

disp(norm(A*V-U*S));

[ U2 S2 V2]=mysvd2(A);
disp(norm(S2-S1));
disp(S2);
disp(U2);
disp(V2);
