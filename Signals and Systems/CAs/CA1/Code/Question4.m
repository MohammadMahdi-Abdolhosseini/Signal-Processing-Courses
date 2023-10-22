%Question4:=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
clear; close all; clc;
[x,Fs] = audioread("gettysburg10.wav");
fprintf("==> Fs: Sampling Frequency = %d\n",Fs);

%Question4_1:=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
[b,~] = size(x);
t = linspace(0,10,b);
plot(t,x);
xlabel("t");
legend("audio data");
%sound(x,Fs);
%pause(10);

%Question4_3:=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
n0 = 1*Fs;	% 1sec echo
a = 0.81;   % power of echo = 81%
y1 = x;
for n = 1:b
    if n > n0
        y1(n) = x(n) + a*x(n - n0);
    end
end
%sound(y1,Fs);
%pause(10);
audiowrite("y1.wav",y1,Fs);

%Question4_4:=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
n0 = 0.4*Fs;
a = 0.1;
y_best = x;
for n = 1:b
    if n > n0
        y_best(n) = x(n) + a*x(n - n0);
    end
end
%sound(y_best,Fs);
%pause(10);
audiowrite("y_best.wav",y_best,Fs);

%Question4_5:=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
[x_test,Fs_test] = audioread("x_test.wav");
[y_test,~] = audioread("y_test.wav");
[b,~] = size(x_test);
r = xcorr(x_test,y_test);
n0 = int16(max(r)); % <==
y_test2 = x_test;
for n = 1:b
    if n > n0
        y_test2(n) = x_test(n - n0);    % only shift values
    end
end
y_test3 = y_test(1:b,1);    % length y_test3 = x_test
y_test3 = y_test3 - x_test; % y_test3 = a*x_test(n - n0)
a = (max(y_test3)/max(y_test2));   % <==
fprintf("n0 = %d\na = %f\n", n0, a);
% sound(y_test,Fs_test);
% pause(10);
% sound(y_test2,Fs_test);
% pause(10);
% sound(y_test3,Fs_test);
% pause(10);
y_test4 = x_test;
for n = 1:b
    if n > n0
        y_test4(n) = x_test(n) + a*x_test(n - n0);    % only shift values
    end
end
% sound(y_test4,Fs_test);
% pause(10);