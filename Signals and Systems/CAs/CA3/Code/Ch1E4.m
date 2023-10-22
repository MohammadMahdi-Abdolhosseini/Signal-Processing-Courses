% x4 = cos(30pi*t + pi/4) 
% =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
% Signals And Systems
% Computer Assignment 3
% Chapter Number One . Exercise Number Four : 1.4
% Mohammad Mahdi Abdolhosseini
% Spring 2021
% =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
clc; clear; close all;

fs = 100;
ts = 1/fs;

t_start = 0;
t_end = 1;
t = t_start : ts : t_end - ts;

T = t_end - t_start;
N = T/ts;
delta_f = 1/T;

x4 = cos(30*pi*t + pi/4);

y4 = fftshift(fft(x4));
f = -fs/2 : fs/N : fs/2 - fs/N;

figure
subplot(2,1,1)
y4new = y4/max(abs(y4));
plot(f, abs(y4new));
title('Part A : abs Fourier Transform x4')
set(gca,'xtick', -fs/2 : 5 : fs/2 - fs/N, 'xlim', [-fs/2,fs/2 - fs/N])
set(gca,'ytick', -1 : 0.2 : 3, 'ylim', [-0.2,1.5])
legend('|X4|')
grid on

subplot(2,1,2)
tol = 1e-6;
y4(abs(y4) < tol) = 0;
theta = angle(y4);
plot(f,theta/pi)
title('Part B : phase Fourier Transform x4')
set(gca,'xtick', -fs/2 : 5 : fs/2 - fs/N, 'xlim', [-fs/2,fs/2 - fs/N])
set(gca,'ytick', -1 : 0.1 : 3, 'ylim', [-0.3,0.4])
legend('phase X4')
xlabel 'Frequency (Hz)'
ylabel 'Phase / \pi'
grid on
