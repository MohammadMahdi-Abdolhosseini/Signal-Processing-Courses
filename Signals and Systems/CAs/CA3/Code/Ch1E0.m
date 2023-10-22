% x1 = exp(j2pi*5t) + exp(j2pi*8t)
% x2 = exp(j2pi*5t) + exp(j2pi*5.1t)
% =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
% Signals And Systems
% Computer Assignment 3
% Chapter Number One . Exercise Number Zero : 1.0
% Mohammad Mahdi Abdolhosseini
% Spring 2021
% =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
clc; clear; close all;

fs = 20;
ts = 1/fs;

t_start = 0;
t_end = 1;
t = t_start : ts : t_end - ts;

T = t_end - t_start;
N = T/ts;
delta_f = 1/T;

x1 = exp(1j*2*pi*5*t) + exp(1j*2*pi*8*t);
y1 = fftshift(fft(x1));
x2 = exp(1j*2*pi*5*t) + exp(1j*2*pi*5.1*t);
y2 = fftshift(fft(x2));
f = -fs/2 : fs/N : fs/2 - fs/N;

figure
subplot(2,1,1)
y1new = y1/max(abs(y1));
plot(f, abs(y1new));
title('abs Fourier Transform x1')
set(gca,'xtick', -fs/2 : 1 : fs/2 - fs/N, 'xlim', [-fs/2,fs/2 - fs/N])
set(gca,'ytick', -1 : 0.2 : 3, 'ylim', [-0.5,1.5])
legend('|X1|')
grid on

subplot(2,1,2)
y2new = y2/max(abs(y2));
plot(f, abs(y2new));
title('abs Fourier Transform x2')
set(gca,'xtick', -fs/2 : 1 : fs/2 - fs/N, 'xlim', [-fs/2,fs/2 - fs/N])
set(gca,'ytick', -1 : 0.2 : 3, 'ylim', [-0.5,1.5])
legend('|X2|')
grid on

