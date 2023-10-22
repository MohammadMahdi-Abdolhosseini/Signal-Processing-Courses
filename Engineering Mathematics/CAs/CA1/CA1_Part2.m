function Part2
%   Error calculation and Logarithmic diagram
%   Enter Values:
%   Mohammad Mahdi Abdolhosseini
%   810 198 434
N = input('Enter The Value of N: ');
beta = input('Enter The Value of beta: ');
alfa = input('Enter The Value of alfa: ');
T = input('Enter The Value of T: ');
Fx = @(x) (x.^beta).*(exp(alfa.*x));
sfaouria = @(x)(1./T).*integral(Fx,-T./2,T./2);
for n = 1:N
    Fxc = @(x) (x.^beta).*(exp(alfa.*x)).*(cos(n.*(2.*pi./T).*x));
    An = (2./T).*integral(Fxc,-T./2,T./2);
    Fxs = @(x) (x.^beta).*(exp(alfa.*x)).*(sin(n.*(2.*pi./T).*x));
    Bn = (2./T).*integral(Fxs,-T./2,T./2);
    sfaouria = @(x) sfaouria(x) + An.*cos(n.*(2.*pi./T).*x) + Bn.*sin(n.*(2.*pi./T).*x);
end
E = @(x) (Fx(x) - sfaouria(x)).^2;
E = (1./T).*integral(E,-T./2,T./2);
fprintf('E = %.4f\n',E)

syms Nn;
Fx = @(x) (x.^beta).*(exp(alfa.*x));
sfaouria = @(x)(1./T).*integral(Fx,-T./2,T./2);
figure
for Nn = 1:49
    Fx = @(x) (x.^beta).*(exp(alfa.*x));
    sfaouria = @(x)(1./T).*integral(Fx,-T./2,T./2);
    for n = 1:Nn
        Fxc = @(x) (x.^beta).*(exp(alfa.*x)).*(cos(n.*(2.*pi./T).*x));
        An = (2./T).*integral(Fxc,-T./2,T./2);
        Fxs = @(x) (x.^beta).*(exp(alfa.*x)).*(sin(n.*(2.*pi./T).*x));
        Bn = (2./T).*integral(Fxs,-T./2,T./2);
        sfaouria = @(x) sfaouria(x) + An.*cos(n.*(2.*pi./T).*x) + Bn.*sin(n.*(2.*pi./T).*x);
    end
    E = @(x) (Fx(x) - sfaouria(x)).^2;
    E = (1./T).*integral(E,-T./2,T./2);
    plot(Nn,log(E),'r.');hold on; grid on;
    title('[Error Logarithmic diagram]');
    xlabel('N');
    ylabel('log(E)');
end
end