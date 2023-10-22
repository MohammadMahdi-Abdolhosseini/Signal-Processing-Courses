%Question3:
clear; close all; clc;
x = [2 -2 7 -3 2 4 -6 1];
h = [5 2 4 -6 5 1 -8 0 7 2 9];
result = [zeros(1,1) conv(x,h)];
bar(result,0.2);
set(gca,'xtick', 0 : 1 : 20, 'xlim', [0,20])
set(gca,'ytick', -100 : 20 : 150, 'ylim', [-100,150])
xlabel("n");
ylabel("x*h");
legend("(x*h)[n]");