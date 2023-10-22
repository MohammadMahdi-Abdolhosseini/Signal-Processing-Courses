%Q3: Part 2&3:
clc;
clear;
syms r r1 r2
R1 = 1;
R2 = 2;
figure
for r = [R1,R2]
    [X,Y,H] = cylinder(r);
    subplot(1,3,1);
    surf(X,Y,H)
    title('Z')
    xlabel('X','Color','b');
    ylabel('Y','Color','b');
    zlabel('H','Color','b');
    set(get(gca,'zlabel'),'rotation',0)
    hold on
    Z = complex(X,Y);
    W = log(Z);
    U = real(W);
    V = imag(W);
    % ln(R1) < U < ln(R2)
    % -pi < V < pi
    subplot(1,3,2)
    surf(U,V,H)
    title('W = Ln(Z)')
    xlabel('U','Color','b');
    ylabel('V','Color','b');
    zlabel('H','Color','b');
    set(get(gca,'zlabel'),'rotation',0)
    hold on
end
%Part 3:
epsilon0 = 8.85*10^(-12);
x = 1:0.01:2;
C = (2*pi*epsilon0)./log(x);% x = r2/r1
subplot(1,3,3)
plot(x,C);
set(gca,'xtick', 1 : 0.2 : 1.8, 'xlim', [1,1.8])
set(gca,'ytick', 0 : 10^(-9) : 5*10^(-9), 'ylim', [0,5*10^(-9)])
xlabel('R2/R1','Color','b');
ylabel('C','Color','b');
set(get(gca,'ylabel'),'rotation',0);