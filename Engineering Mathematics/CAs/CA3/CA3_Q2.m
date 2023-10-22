%Q2: Mapping in the Complex Plane
clc;
clear;
syms x y r t z
[r ,t] = meshgrid(0:0.001:1,0:0.0005*pi:pi/2);
x = r.*cos(t);
y = r.*sin(t);
figure
subplot(2,2,1)
h=zeros(size(x));
mesh(x,y,h), view(2)
title('Z')
z = complex(x,y);
%=-=-=-=-=-=-=-=-=
iw = sin(z);
iu = real(iw);
iv = imag(iw);
subplot(2,2,2)
mesh(iu,iv,h), view(2)
title('W = sin(Z)')
%=-=-=-=-=-=-=-=-=
iiw = z.^2 + z;
iiu = real(iiw);
iiv = imag(iiw);
subplot(2,2,3)
mesh(iiu,iiv,h), view(2)
title('W = Z^{2} + Z')
%=-=-=-=-=-=-=-=-=
iiiw = log(z) + z/2;
iiiu = real(iiiw);
iiiv = imag(iiiw);
subplot(2,2,4)
mesh(iiiu,iiiv,h), view(2)
title('W = ln(Z) + Z/{2}')
%=-=-=-=-=-=-=-=-=