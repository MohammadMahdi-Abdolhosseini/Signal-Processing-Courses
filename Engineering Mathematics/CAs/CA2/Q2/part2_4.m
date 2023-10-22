x = 0.01:0.01:1;
t = 0:0.1:10;
sol = pdepe(0,@Equation,@Init,@BC,x,t);
colormap(cool);
surf(x,t,sol);
xlabel('x');
ylabel('t');
zlabel('u');
colorbar;