clc,clear,close all;
I = imread('coins.png');
imshow(I);impixelinfo;title('Original Image');
[r, c]=size(I);
M = imnoise(I,'salt & pepper',0.02);
imshowpair(I,M,'montage');title("Original and noisy image");
maskr = input('Enter mask rows');
maskc = input('Enter mask cols');
rowadd = (maskr - 1)/2;%Row padding
coladd = (maskc - 1)/2;%Column padding

paddedImage = padarray(M,[rowadd,coladd],'replicate');
subplot(211);imshow(paddedImage);impixelinfo; 
title('Padded Image with added noise');

for i = 1 + rowadd : r + rowadd%Run uptil total rows
    for j = 1 + coladd : c + coladd%Run uptil total columns
        subImage = paddedImage(i - rowadd : i + rowadd , j - coladd : j + coladd);
        x = reshape(subImage,[1,maskr*maskc]);
        x = sort(x);
        med = x((length(x)+1)/2);        
        result(i, j) = med;
    end
end
subplot(212);imshow(result(1 + rowadd : r + rowadd , 1 + coladd : c + coladd));
impixelinfo;title('Restored Image');




