function [myinv] = p2(X)
[row,column] = size(X);
if p1(X) ~= 0
    if row == column
        myinv = zeros(row);
        if row == 2
            myinv = 1/p1(X) * [X(4) -X(3); -X(2) X(1)];
        else
            for i = 1:row
                for j = 1:row
                    k = X;
                    k(j,:) = [];
                    k(:,i) = [];
                    myinv(j,i) = p1(k)*(-1)^(i+j);
                end
            end
            myinv = 1/p1(X) * (myinv.');
        end
    else
        disp("!!! Please enter n*n matrix.");
    end
else
    disp("!!! The matrix is not invertible.");
end