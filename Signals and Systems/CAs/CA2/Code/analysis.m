clc; clear; close all;
[a,fs] = audioread("a.wav");
sound(a,fs);
%% Generate Source Signals
fL = [697 770 852 941];             % Low Frequency Group
fH = [1209 1336 1477];              % High Frequency Group
Ts = 1/fs;                          % Signal Sampling Time
Ton = 0.1;                          % ON Time for each DTMF Signal (in second)
Toff = 0.1;                         % OFF Time ; The Gap Between DTMF Signals (in second)
t = 0:Ts:Ton;
[~, T] = size(t);
t = t(2:T);                         % Drop Zero Value of t
T = T - 1;                          % T Equals to New Size of t
alpha = round(Toff/Ton);            % we need this to Calculate Silence Times (OFF Times)
% Source Signals :
y = zeros(4,3,T);
for L = 1:4
    yL = sin(2*pi*fL(L)*t);         % Low Frequency Signal
    for H = 1:3
        yH = sin(2*pi*fH(H)*t);     % High Frequency Signal
        y(L, H, :) = (yL + yH)/2;   % Source Signal
    end
end
%% Extracting "a.wav" T(on) ?
[aSize, ~] = size(a);
numOfNumbers = (aSize / T) * 1/2;   % 1/2 = Ton/(Ton + Toff)
x = zeros(T, numOfNumbers);
for n = 1:numOfNumbers
    % Drop Gaps (OFF Times) 
    x(:, n) = a((1 + alpha)*(n - 1)*T + 1 : T + (1 + alpha)*(n - 1)*T); 
end
%% r = Correlation Coefficient (x,y)
% y2n = sum(y.^2,3);
% y2n approximately for all keyboard is the same ; so we don't need to use it for finding r(max)
xyn = zeros(4,3,numOfNumbers);      % xyn = sigma x[n]*y[n]
for n = 1:numOfNumbers
    for L = 1:4
        for H = 1:3
            xyn(L, H, n) = sum((x(:, n).').*reshape(y(L,H,:),[1,800]),2);
        end
    end
end
%% Find The Number from r(max)
number = -1*ones(1,numOfNumbers);
maxValue = max(xyn,[],[1 2]);       % xyn(max) ==> r(max) :)
maxIndex = mod(find(xyn == maxValue),12);
for n = 1:numOfNumbers
    if maxIndex(n) == 1
        number(n) = 1;
    elseif maxIndex(n) == 2
        number(n) = 4;
    elseif maxIndex(n) == 3
        number(n) = 7;
    elseif maxIndex(n) == 4
        number(n) = '*';
    elseif maxIndex(n) == 5
        number(n) = 2;
    elseif maxIndex(n) == 6
        number(n) = 5;
    elseif maxIndex(n) == 7
        number(n) = 8;
    elseif maxIndex(n) == 8
        number(n) = 0;
    elseif maxIndex(n) == 9
        number(n) = 3;
    elseif maxIndex(n) == 10
        number(n) = 6;
    elseif maxIndex(n) == 11
        number(n) = 9;
    elseif maxIndex(n) == 0
        number(n) = '#';
    end
    if number(n) < 10
        number(n) = number(n) + 48; % Using ASCII Table
    end
end
disp(['ANALYSIS RESAULT : ' char(number)]);