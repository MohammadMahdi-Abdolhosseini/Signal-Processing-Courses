% x5 = sigma rectpuls(t - 2k)
% =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
% Signals And Systems
% Computer Assignment 3
% Chapter Number One . Exercise Number Five : 1.5
% Mohammad Mahdi Abdolhosseini
% Spring 2021
% =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
clc; clear; close all;

fs = 50;
ts = 1/fs;

t_start = -19;
t_end = 19;
t = t_start : ts : t_end - ts;

T = t_end - t_start;
N = T/ts;
delta_f = 1/T;

x5 = zeros;
for k = -9:1:9
    x5 = x5 + rectpuls(t-2*k);
end

figure
subplot(2,1,1)
plot(t, x5, 'r');
title('Part A : x5')
set(gca,'xtick', t_start - 1 : 2 : t_end, 'xlim', [t_start,t_end - ts])
set(gca,'ytick', -1 : 0.5 : 3, 'ylim', [-0.2,1.4])
legend('x5')
grid on

y5 = fftshift(fft(x5));
f = -fs/2 : fs/N : fs/2 - fs/N;

subplot(2,1,2)
y5new = y5/max(abs(y5));
plot(f, abs(y5new));
title('Part B : abs Fourier Transform x5')
set(gca,'xtick', -fs/2 - 1 : 2 : fs/2 - fs/N, 'xlim', [-fs/2,fs/2 - fs/N])
set(gca,'ytick', -1 : 0.2 : 3, 'ylim', [-0.2,1.5])
legend('|X5|')
grid on
