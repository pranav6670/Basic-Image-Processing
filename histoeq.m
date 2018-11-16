clc, clear, close all;
A = imread('pout.tif');figure;imshow(A);impixelinfo;title('Original Image');
[rows, cols] = size(A);
h = zeros(1, 256);
%% Image Histogram
 for a = 1 : rows
     for b = 1 : cols
         ind = A(a, b);
         ind = ind + 1;
         h(ind) = h(ind) + 1; %Histogram Vector
     end
 end
figure;bar(h);title('Histogram of original image');
%% Calculation of CDF,mapping function
CDF = double(((1/(rows * cols)) * cumsum(h)));figure;plot(CDF);title('CDF');%CDF
S = round(255 *  CDF);%Actual mapping
%% Equalization Mechanism
for i = 1 : rows
    for j = 1 : cols
        index = A(i, j);
        index = index + 1;
        op(i, j) = S(index);%Storing mapped and equalized values as an image.
    end
end
figure;imhist(uint8(op));title('Histogram of equalized image');
figure;imshow(uint8(op));title('Equalized image');
%%


