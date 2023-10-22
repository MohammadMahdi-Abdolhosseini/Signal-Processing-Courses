% Chapter #3 : Part B
% =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
% Signals And Systems
% Computer Assignment 4
% Chapter #3 : Part B
% Mohammad Mahdi Abdolhosseini
% Spring 2021
% =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
clc; clear; close all;

syms y(t);
Dy = diff(y);
D2y = diff(y,2);
ode = D2y + 3*Dy + 2*y == 5;
cond1 = y(0) == 1;
cond2 = Dy(0) == 1;
cond = [cond1 cond2];
sol(t) = dsolve(ode, cond);


disp('y(t) = ')
pretty (sol(t))

t = 0:0.01:10;
plot(t, sol(t))
title('Chapter #3 : Part B')
set(gca,'xtick', 0 : 1 : 10, 'xlim', [0,10])
set(gca,'ytick', 0 : 0.5 : 3, 'ylim', [0,3])
legend('y(t)')
grid on

