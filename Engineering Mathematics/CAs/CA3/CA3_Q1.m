%Q1: solving complex integral using residue theorem
clc;
clear;
syms t z
z = exp(1i*t); %cos(t) + 1i*sin(t)
i = z^3 + 2*z^2 + 1;
ii = 1/(z-1i/9)^3;
iii = 1/(z^2 + 1/4);
%Part A:
disp('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
disp('#Part A:');
dz = diff(z);
iA = int(i*dz,[0 2*pi]);
iiA = int(ii*dz,[0 2*pi]);
iiiA = int(iii*dz,[0 2*pi]);
fprintf('i: %f%+fj\n',real(iA), imag(iA));
fprintf('ii: %f%+fj\n',real(iiA), imag(iiA));
fprintf('iii: %f%+fj\n',real(iiiA), imag(iiiA));
disp('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
%Part B&C:
disp('#Part B:');
ib = [1 2 0 1]; %z^3 + 2*z^2 + 1
ia = 1;
iib = 1;
iia = [1 -1i/3 -1/27 1i/729]; %z^3 - (i z^2)/3 - z/27 + i/729
iiib = 1;
iiia = [1 0 1/4]; %z^2 + 1/4
[ir,ip] = residue(ib,ia);
[iir,iip] = residue(iib,iia);
[iiir,iiip] = residue(iiib,iiia);
disp('ipoles:')
disp('   NaN')
disp('iipoles:')
disp(iip)
disp('iiipoles:')
disp(iiip)
disp('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
disp('#Part C:');
disp('iresidues:')
disp('   NaN')
disp('iiresidues:')
disp(iir)
disp('iiiresidues:')
disp(iiir)
disp('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
%Part D:
disp('#Part D:');
iD = 1i*2*pi*sum(ir);
iiD = 1i*2*pi*sum(iir);
iiiD = 1i*2*pi*sum(iiir);
fprintf('i: %f%+fj\n',real(iD), imag(iD));
fprintf('ii: %f%+fj\n',real(iiD), imag(iiD));
fprintf('iii: %f%+fj\n',real(iiiD), imag(iiiD));
disp('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
%???????????????????????????????????????????????????????????????????
disp('???????????????????????????????????????????????????????????');
