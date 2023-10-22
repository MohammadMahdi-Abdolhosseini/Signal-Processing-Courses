function [mydet] = p1(X)
[row,column] = size(X);
if row == column
    mydet = 0;
    if row == 2
        mydet = X(1)*X(4)-X(2)*X(3);
    else
        for i = 1:row
            l = X(1,i)*(-1)^(i+1);
            m = X;
            m(1,:) = [];
            m(:,i) = [];
            mydet = mydet + l*p1(m);
        end
    end
else
    disp("!!! Please enter n*n matrix.");
end