x = 0.01:0.01:1;
t = 0:0.1:10;
sol = pdepe(0,@Equation,@Init,@BC,x,t);
for tn = 0:5:10
    u = sol(10*tn+1,:,1);
    p = plot(x,u);
    hold on;
    xlabel('x');
    ylabel('u');
    p(1).LineWidth = 1.5;
end
legend('t = 0','t = 5','t = 10');