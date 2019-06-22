[U, X] = qr(randn(80));
[V, X] = qr(randn(80));
S = diag( 2 .^ (-1:-1:-80));
A = U*S*V;

[QC, RC] = mycgs(A);
[QM, RM] = mymgs(A);
[Q, R] = qr(A);

qc = norm( QC'*QC-eye(80));
qm = norm( QM'*QM-eye(80));
q = norm( Q'*Q-eye(80));

x= (1:80)';
f=figure();
semilogy(x, abs(diag( RC ) ), 'bo');
hold on;
semilogy(x, abs(diag( RM ) ), 'rx');
semilogy(x, abs(diag( R ) ), 'k+');
title('abs(diag(R)) for cgs, mgs and qr');
%gtext('cgs=o, mgs = x, qr=+');
close(f);

[QQC, RRC] = mycgs(QC);
RR= RRC*RC;
qqc = norm( QQC'*QQC-eye(80));
f=figure();
semilogy(x, abs(diag( RR ) ), 'bo');
hold on;
semilogy(x, abs(diag( RM ) ), 'rx');
semilogy(x, abs(diag( R ) ), 'k+');
title('abs(diag(R)) for cgs, mgs and qr');
%gtext('cgs=o, mgs = x, qr=+');
close(f);