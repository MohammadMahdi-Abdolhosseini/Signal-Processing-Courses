% x1 = cos(10pi*t)
% =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
% Signals And Systems
% Computer Assignment 3
% Chapter Number One . Exercise Number One : 1.1
% Mohammad Mahdi Abdolhosseini
% Spring 2021
% =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
clc; clear; close all;

fs = 50;
ts = 1/fs;

t_start = -1;
t_end = 1;
t = t_start : ts : t_end - ts;

T = t_end - t_start;
N = T/ts;
delta_f = 1/T;

x1 = cos(10*pi*t);

figure
subplot(2,1,1)
plot(t, x1, 'r');
title('Part A : x1')
set(gca,'xtick', t_start : 0.2 : t_end, 'xlim', [t_start,t_end - ts])
set(gca,'ytick', -1 : 0.5 : 3, 'ylim', [-1.2,1.4])
legend('x1')
grid on

y1 = fftshift(fft(x1));
f = -fs/2 : fs/N : fs/2 - fs/N;

subplot(2,1,2)
y1new = y1/max(abs(y1));
plot(f, abs(y1new));
title('Part B : abs Fourier Transform x1')
set(gca,'xtick', -fs/2 : 5 : fs/2 - fs/N, 'xlim', [-fs/2,fs/2 - fs/N])
set(gca,'ytick', -1 : 0.2 : 3, 'ylim', [-0.1,1.3])
legend('|X1|')
grid on
