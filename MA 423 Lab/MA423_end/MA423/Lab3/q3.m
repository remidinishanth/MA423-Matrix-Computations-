X = linspace(0,1,50);
w = randn(7, 1);
A=fliplr(vander(X));
A = A(:,1:7);
b = A*w;

format long;
xhat = (A'*A)\(A'*b);
rhat = b - A*xhat;
err = norm(xhat-w)/norm(w);
fprintf('Rel err = %f  Residue = %f \n\n',err,norm(rhat)/norm(b));
disp(norm(rhat)/norm(b));

xtilde = A\b;
err = norm(xtilde-w)/norm(w);
rtilde = b - A*xtilde;
fprintf('Rel err = %f  Residue = %f \n\n',err,norm(rtilde)/norm(b));
disp(norm(rtilde)/norm(b));
format;

%%% b) %%

d = 6:1:15;

arh = [];
erh = [];
art = [];
ert = [];

for i=1:length(d)
    deg = d(i);
    w = randn(deg, 1);
    A=fliplr(vander(X));
    A = A(:,1:deg);
    b = A*w;
    
    format long;
    xhat = (A'*A)\(A'*b);
    rhat = b - A*xhat;
    err = norm(xhat-w)/norm(w);
    %fprintf('Rel err = %f  Residue = %f \n\n',err,norm(rhat)/norm(b));
    %disp(norm(rhat)/norm(b));
    arh = [arh; norm(rhat)/norm(b)];
    erh = [erh;err];

    xtilde = A\b;
    err = norm(xtilde-w)/norm(w);
    rtilde = b - A*xtilde;
    %fprintf('Rel err = %f  Residue = %f \n\n',err,norm(rtilde)/norm(b));
    %disp(norm(rtilde)/norm(b));
    art = [art; norm(rtilde)/norm(b)];
    ert = [ert;err];
    format;
end

f=figure();
plot(d',log10(arh));
hold on;
plot(d',log10(art));
legend('Normal','QR');
title('Residue');

f=figure();
plot(d',log10(erh));
hold on;
plot(d',log10(ert));
legend('Normal','QR');
title('Relative error');