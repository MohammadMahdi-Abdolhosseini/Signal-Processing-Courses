function Part3
%   min N for Error <= E
%   Enter Values:
%   Mohammad Mahdi Abdolhosseini
%   810 198 434
E = input('Enter The Value of E: ');
beta = input('Enter The Value of beta: ');
alfa = input('Enter The Value of alfa: ');
T = input('Enter The Value of T: ');
syms Nn;
i = 0; Nn = 1;
while i == 0
    Fx = @(x) (x.^beta).*(exp(alfa.*x));
    sfaouria = @(x)(1./T).*integral(Fx,-T./2,T./2);
    for n = 1:Nn
        Fxc = @(x) (x.^beta).*(exp(alfa.*x)).*(cos(n.*(2.*pi./T).*x));
        An = (2./T).*integral(Fxc,-T./2,T./2);
        Fxs = @(x) (x.^beta).*(exp(alfa.*x)).*(sin(n.*(2.*pi./T).*x));
        Bn = (2./T).*integral(Fxs,-T./2,T./2);
        sfaouria = @(x) sfaouria(x) + An.*cos(n.*(2.*pi./T).*x) + Bn.*sin(n.*(2.*pi./T).*x);
    end
    Ep = @(x) (Fx(x) - sfaouria(x)).^2;
    Ep = (1./T).*integral(Ep,-T./2,T./2);
    if Ep <= E
        fprintf('min N = { %d }\n',Nn);
        i = 1;
    end
    Nn = Nn + 1;
end
end