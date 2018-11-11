
clc,close,clear all;
im = imread('cameraman.tif');figure(1);
imshow(im);impixelinfo;title("Original Image");im=im2double(im);

[r, c] = size(im);
im_fft = fft2(im);figure;imshow(log(abs(im_fft)));title("Image FT");
imfft_shifted = fftshift(im_fft);figure;imshow(log(abs(imfft_shifted)));title("Image FT shifted");

mask = zeros(r, c);
D0 = input('Enter the distance from center');
Cx = round(r/2); Cy = round(c/2);
for i = 1 : r
    for j = 1 : c
        D = sqrt((Cx-i)^2 + (Cy-j)^2);
        if D0 <= D
            mask(i, j) = 255;          
        end
    end
end
figure;imshow(uint8(mask));title("Mask");

im_filtered =  mask .* imfft_shifted;
figure;imshow(uint8(im_filtered));title("Filtered but not shifted");

imfiltered_shift = ifftshift(im_filtered);
figure;imshow(uint8(im_filtered));title("Filtered and shifted");

imfiltered_ifft = ifft2(imfiltered_shift);
figure;imshow(uint8(imfiltered_ifft));title("Filtered, shifted and IFFT");





