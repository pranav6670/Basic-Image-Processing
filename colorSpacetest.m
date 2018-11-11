clc, clear, close all;
im = imread('peppers.png');%Read the Image
figure;imshow(im);impixelinfo;title('Original image');

%% Get RGB values
R = double(im(:, :, 1));
figure;imshow(uint8(R));impixelinfo;title('R plane');
G = double(im(:, :, 2));
figure;imshow(uint8(G));impixelinfo;title('G plane');
B = double(im(:, :, 3));
figure;imshow(uint8(B));impixelinfo;title('B plane');

%% RGB to Gray 
Gr = (R+G+B)/3;
figure;imshow(uint8(Gr));impixelinfo;title('Grayscale image');
% help ntsc2rgb;

%% Find YIQ values
Y = 0.299 * R + 0.587 * G + 0.114 * B;
figure;imshow(uint8(Y));impixelinfo;title('Y plane');
I = 0.596 * R - 0.274 * G - 0.322 * B;
figure;imshow(uint8(I));impixelinfo;title('I plane');
Q = 0.211 * R - 0.523 * G + 0.312 * B;
figure;imshow(uint8(Q));impixelinfo;title('Q plane');

%% Concatenate
C = cat(3, Y, I, Q); 
figure;imshow(uint8(C));impixelinfo;title('Concatenated YIQ image');

% help rgb2ntsc;

%% Find RGB values
r = 1.000 * Y + 0.956 * I + 0.621 * Q;
g = 1.000 * Y - 0.272 * I - 0.647 * Q;
b = 1.000 * Y - 1.106 * I + 1.706 * Q;

%% Concatenate
c = cat(3, r, g, b);
figure;imshow(uint8(c));title('Concatenated RGB image');
% figure;imshowpair(uint8(c),im,'montage');title('L-Original, R-Concatented');

%% Plane wise Subtraction
a = double(im(:,:,:)) - double(c(:,:,:));
figure;imshow(uint8(a));impixelinfo;title('Subtracted image');


