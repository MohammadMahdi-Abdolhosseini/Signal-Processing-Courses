% x7 = 1
% =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
% Signals And Systems
% Computer Assignment 3
% Chapter Number Two . Exercise Number One : 2.1
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

x7 = ones(N);

figure
subplot(2,1,1)
plot(t, x7, 'r');
title('Part A : x7')
set(gca,'xtick', t_start - 1 : 0.2 : t_end, 'xlim', [t_start,t_end - ts])
set(gca,'ytick', 0 : 0.5 : 3, 'ylim', [-0.2,1.4])
legend('x7')
grid on

y7 = fftshift(fft(x7));
f = -fs/2 : fs/N : fs/2 - fs/N;

subplot(2,1,2)
y7new = y7/max(abs(y7));
plot(f, abs(y7new));
title('Part B : abs Fourier Transform x7')
set(gca,'xtick', -fs/2 - 1 : 2 : fs/2 - fs/N, 'xlim', [-fs/2,fs/2 - fs/N])
set(gca,'ytick', -1 : 0.5 : 3, 'ylim', [-0.1,1.4])
legend('|X7|')
grid on
