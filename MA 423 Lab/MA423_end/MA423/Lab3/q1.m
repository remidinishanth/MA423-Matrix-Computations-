%%% a)%%
A = [ones(5,1),(1:0.5:3)'];

%%% b) %%
b = [1.1;1.2;1.3;1.3;1.4];
x = A\b;
disp(x);

%%% c) %%
f=figure();
plot(1:0.5:3,b,'*');
hold on;
grid on;
plot(1:0.5:3,A*x,'.-');
saveas(f,'q1c.png');
close(f);

%%% d) %%
r = norm(A*x - b,2);
