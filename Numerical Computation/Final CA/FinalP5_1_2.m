% Mohammad Mahdi Abdolhosseini
% 810198434
% Part 1&2:
clc; clear;

f = @(x) (1-cos(x))/x^2;
a = pi*10 ^ (-8);
f(a)
disp('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=')
f = @(x) (1-cos(x))/x^2;
for i = -9:0.5:-0.5
    a = pi*10 ^ (i);
    fprintf('f(pi*10^(%.1f)=%f) = %.4f\n', i, a, f(a));
end
disp('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=')
f1 = @(x) (1000^x)/(exp(20*x));
f2 = @(x) (1000/exp(20))^x;
a = 200;
fprintf('f1(%d) = %.2f\n', a, f1(a));
fprintf('f2(%d) = %.2f\n', a, f2(a));