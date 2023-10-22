% Mohammad Mahdi Abdolhosseini
% 810198434
% Part3: Image Processing
clc; clear;
I = imread('Image.jpg');
subplot(1,2,1);
imshow(I);
title('Original Image')
I2 = I;
[a, b] = size(I);
for n = 1:1:a
    for m = 1:1:b
        if I(n, m) > 130
            I2(n, m) = 1.2*I(n, m);
        else
            I2(n, m) = 0.8*I(n, m);
        end
    end
end
subplot(1,2,2);
imshow(I2);
title('Modified Image')