x = 0.01:0.02:1;
t = 0:0.2:10;
sol = pdepe(0,@Equation,@Init,@BC,x,t);
u = sol(:,:,1);
colormap(cool);
imagesc(x,t,u);
xlabel('x');
ylabel('t');
colorbar;