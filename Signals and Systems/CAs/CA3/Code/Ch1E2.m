% x2 = rectpuls(t)
% =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
% Signals And Systems
% Computer Assignment 3
% Chapter Number One . Exercise Number Two : 1.2
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

x2 = rectpuls(t);

figure
subplot(2,1,1)
plot(t, x2, 'r');
title('Part A : x2')
set(gca,'xtick', t_start : 0.2 : t_end, 'xlim', [t_start,t_end - ts])
set(gca,'ytick', -1 : 0.5 : 3, 'ylim', [-0.2,1.4])
legend('x2')
grid on

y2 = fftshift(fft(x2));
f = -fs/2 : fs/N : fs/2 - fs/N;

subplot(2,1,2)
y2new = y2/max(abs(y2));
plot(f, abs(y2new));
title('Part B : abs Fourier Transform x2')
set(gca,'xtick', -fs/2 : 5 : fs/2 - fs/N, 'xlim', [-fs/2,fs/2 - fs/N])
set(gca,'ytick', -1 : 0.2 : 3, 'ylim', [-0.2,1.5])
legend('|X2|')
grid on
