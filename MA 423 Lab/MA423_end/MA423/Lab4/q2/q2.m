for i=7:12
    n=i;
    H = hilb(i);
    [QC, RC] = mycgs(H);
    qc=norm(eye(n)-QC'*QC);
    [QM, RM] = mymgs(H);
    qm=norm(eye(n)-QM'*QM);
    [QQM,RRM]= mymgs(QM);
    qqm=norm(eye(n)-QQM'*QQM);
    [Q, R] = qr(H,0);
    q=norm(eye(n)-Q'*Q);
    r = norm(H - Q*R);
    fprintf('Hilbert matrix of size %d\n',i);
    fprintf('CGS : %f\n MGS : %f\n MMGS : %f\n QR : %f\n Residue : %f\n',qc,qm,qqm,q,r);
    temp = qm - eps*cond(H)/2;
    disp(temp);
end