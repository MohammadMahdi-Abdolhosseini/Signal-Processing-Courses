clc; clear; close all;
%% Initial Values
fL = [697 770 852 941];         % Low Frequency Group
fH = [1209 1336 1477];          % High Frequency Group
fs = 8000;                      % Signal Sampling Frequency
Ts = 1/fs;                      % Signal Sampling Time
Ton = 0.1;                      % ON Time for each DTMF Signal (in second)
Toff = 0.1;                     % OFF Time ; The Gap Between DTMF Signals (in second)
t = 0:Ts:Ton;
%% Enter a Number
number = (num2cell(input("PLEASE ENTER A NUMBER TO SYNTHESIS : ", 's')));
% now we have each number in a separate cell
%% More Variables for Loop

[~, N] = size(number);          % How many digits do we have ?
[~, T] = size(t);

t = t(2:T);                     % Drop Zero Value of t

T = T - 1;                      % T Equals to New Size of t

alpha = round(Toff/Ton);        % we need this to Calculate Silence Times (OFF Times)

% Define Signals :
yL=0;                           % Low Frequency Signal
yH=0;                           % High Frequency Signal
y=zeros(1, N *(1 + alpha)*T);   % Final Encoded Signal
%% For Loop
for n = 1:N
    L=0;H=0;
    if strcmp(number(n), {'1'}) || strcmp(number(n), {'2'}) || strcmp(number(n), {'3'})
        L = 1;
    elseif strcmp(number(n), {'4'}) || strcmp(number(n), {'5'}) || strcmp(number(n), {'6'})
        L = 2;
    elseif strcmp(number(n), {'7'}) || strcmp(number(n), {'8'}) || strcmp(number(n), {'9'})
        L = 3;
    elseif strcmp(number(n), {'*'}) || strcmp(number(n), {'0'}) || strcmp(number(n), {'#'})
        L = 4;
    end
    yL = sin(2*pi*fL(L)*t);     % Low Frequency Signal
    %=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    if strcmp(number(n), {'1'}) || strcmp(number(n), {'4'}) || strcmp(number(n), {'7'}) || strcmp(number(n), {'*'})
        H = 1;
    elseif strcmp(number(n), {'2'}) || strcmp(number(n), {'5'}) || strcmp(number(n), {'8'}) || strcmp(number(n), {'0'})
        H = 2;
    elseif strcmp(number(n), {'3'}) || strcmp(number(n), {'6'}) || strcmp(number(n), {'9'}) || strcmp(number(n), {'#'})
        H = 3;
    end
    yH = sin(2*pi*fH(H)*t);     % High Frequency Signal
    %=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
    % To calculate Final Signal we need to know Priod of each Cycle;
    % it means when do we have ON time and OFF time and next ON-OFF times ?
    % This Code generates ON time Values at the beginning of the cycle
    % and in the next Loop the next cycle begins with a gap between two cycles
    y((1 + alpha)*(n - 1)*T + 1 : T + (1 + alpha)*(n - 1)*T) = (yL + yH)/2;
end
%% Save and Play
audiowrite("y.wav",y,fs);
sound(y,fs);