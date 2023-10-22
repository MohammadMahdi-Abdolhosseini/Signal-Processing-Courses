% x6 = dirac(t)
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

x6 = dirac(t);

figure
subplot(2,1,1)
x6new = x6;
idx = x6 == Inf;        % find Inf
x6new(idx) = 1;         % set Inf to finite value
plot(t, x6new, 'r');
title('Part A : x6')
set(gca,'xtick', t_start - 1 : 0.2 : t_end, 'xlim', [t_start,t_end - ts])
set(gca,'ytick', 0 : 0.5 : 1, 'ylim', [-0.2,1.2])
legend('x6')
grid on

y6 = fftshift(fft(x6new));
f = -fs/2 : fs/N : fs/2 - fs/N;

subplot(2,1,2)
y6new = y6/max(abs(y6));
plot(f, abs(y6new));
title('Part B : abs Fourier Transform x6')
set(gca,'xtick', -fs/2 - 1 : 2 : fs/2 - fs/N, 'xlim', [-fs/2,fs/2 - fs/N])
set(gca,'ytick', -1 : 0.5 : 3, 'ylim', [-0.1,1.4])
legend('|X6|')
grid on
