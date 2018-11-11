clc, close, clear all;
originalImage = imread('cameraman.tif');
figure;imshow(originalImage);title('Original Image');
%% Get sizes 
[r, c] = size(originalImage);
mask = 1/49 * ones(7,7);
% mask = [0 1 0;1 -4 1;0 1 0];
[maskr, maskc] = size(mask);
rowadd = (maskr - 1) / 2;
coladd = (maskc - 1) / 2;
%% image padding for mask
paddedImage = padarray(originalImage,[rowadd, coladd]);
figure;imshow(paddedImage);title('Padded Image');
%% Convolution
for i = 1 + rowadd : r + rowadd
    for j = 1 + coladd : c + coladd
        subImage = paddedImage(i - rowadd : i + rowadd, j - coladd : j + coladd);
        convSum = sum(sum(double(mask).*double(subImage)));
        result(i, j) = convSum;
    end
end
figure;imshow(uint8(result(1 + rowadd : r + rowadd, 1 + coladd : c + coladd)));impixelinfo;title('Smoothened image')