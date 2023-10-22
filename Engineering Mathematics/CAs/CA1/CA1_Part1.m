function Part1
%   Fourier Series
%   Enter Values:
%   Mohammad Mahdi Abdolhosseini
%   810 198 434
N = input('Enter The Value of N: ');
m = input('Enter The Value of m: ');
k = input('Enter The Value of k: ');
beta = input('Enter The Value of beta: ');
alfa = input('Enter The Value of alfa: ');
T = input('Enter The Value of T: ');
Fx = @(x) (x.^beta).*(exp(alfa.*x));
sfaouria = @(x)(1./T).*integral(Fx,-T./2,T./2);
A0 = 1./T.*integral(Fx,-T./2,T./2);
fprintf('The first %d sentences of Fourier Series f(x):\n f(x) = %.2f ',k,A0)
for n = 1:N
    Fxc = @(x) (x.^beta).*(exp(alfa.*x)).*(cos(n.*(2.*pi./T).*x));
    An = (2./T).*integral(Fxc,-T./2,T./2);
    Fxs = @(x) (x.^beta).*(exp(alfa.*x)).*(sin(n.*(2.*pi./T).*x));
    Bn = (2./T).*integral(Fxs,-T./2,T./2);
    sfaouria = @(x) sfaouria(x) + An.*cos(n.*(2.*pi./T).*x) + Bn.*sin(n.*(2.*pi./T).*x);
    if n < k
        w = n.*(2.*pi./T);
        fprintf('+ %.2fCos(%.2fx) + %.2fSin(%.2fx) ',An,w,Bn,w)
    end
end
fprintf('\n')
figure
x = linspace(-T/2,T/2);
y1 = sfaouria(x);
y2 = x.^beta.*exp(alfa.*x);
plot(x,y1,'b',x,y2,'r');hold on;
for n = 1:m-1
    x = x + T;
    plot(x,y1,'b',x,y2,'r');hold on;
end
legend('Fourier Series', 'f(x)=x^{beta}.e^{alfa.x}');
grid on;
title('[Comparing f(x) and Fourier Series]');
xlabel('x');
ylabel('f(x)');
end